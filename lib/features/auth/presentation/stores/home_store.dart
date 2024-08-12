import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/core/util/string_util.dart';
import 'package:flutter_application_1/features/auth/data/data_sources/local/battery_level_service.dart';
import 'package:flutter_application_1/features/auth/data/models/pokemon.dart';
import 'package:flutter_application_1/features/auth/data/models/result.dart';
import 'package:flutter_application_1/features/auth/domain/entities/pokemon.dart';
import 'package:flutter_application_1/features/auth/domain/entities/result.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_more_pokemon_result.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_pokemon.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/get_pokemon_result.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/delete_shared_object.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/get_shared_list.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/get_shared_object.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/save_shared_object.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore(
    this._pokemonResultUseCase,
    this._morePokemonResultUseCase,
    this._pokemonUseCase,
    this._batteryLevelService,
    this._getSharedObject,
    this._getSharedList,
    this._saveSharedObject,
    this._deleteSharedObject,
  ) {
    handleInitHomeApp();
  }

  final GetPokemonResultUseCase _pokemonResultUseCase;
  final GetPokemonUseCase _pokemonUseCase;
  final GetMorePokemonResultUseCase _morePokemonResultUseCase;
  final GetSharedObject _getSharedObject;
  final GetSharedList _getSharedList;
  final SaveSharedObject _saveSharedObject;
  final DeleteSharedObject _deleteSharedObject;
  final BatteryLevelService _batteryLevelService;
  final fToast = FToast();

  @observable
  List<PokemonResultEntity> pokemonResultList = [];

  @observable
  List<PokemonEntity> pokemonList = [];

  @observable
  List<PokemonEntity> favoritePokemonList = [];

  @observable
  List<PokemonEntity> searchPokemonList = [];

  @observable
  ResultEntity? result;

  @observable
  String currentPokemonName = '';

  @observable
  bool isLoading = false;

  @observable
  late int batteryLevel;

  @observable
  bool isCompleted = false;

  @observable
  String? errorMessage;

  @observable
  String searchText = '';

  @observable
  String offset = '0';

  @observable
  String limit = '20';

  @observable
  bool canAddPokemon = false;

  @action
  void setCurrentPokemonName(String name) {
    currentPokemonName = name;

    getFullPokemon();
  }

  @action
  void clearText() => searchText = '';

  @action
  getFullPokemon() async {
    final dataState = await _pokemonUseCase();
    pokemonList = List.from(pokemonList..add(dataState.data!));
  }

  @action
  getMorePokemon() async {
    isLoading = true;

    final dataState = await _morePokemonResultUseCase();

    if (dataState is DataSuccess && dataState.data!.next != '') {
      setPaginationValues(result ?? dataState.data!);
      result = dataState.data!;

      pokemonResultList = result!.results!;

      for (var pokemon in pokemonResultList) {
        currentPokemonName = pokemon.name!;
        await getFullPokemon();
      }

      saveResult();
      removeSharedPokemonList();
      savePokemonList();

      getMorePokemon();
    }

    isLoading = false;
  }

  @action
  handleInitHomeApp() async {
    await getBatteryLevel();
    await getSharedPokemonList();
    await getSharedResult();
    await getSharedFavoritePokemonList();

    if (result != null && pokemonList.length + 1 < result!.count!) {
      setPaginationValues(result!);
      getMorePokemon();
      isCompleted = true;
    } else if (pokemonList.isEmpty) {
      onGetPokemonResult();
    }
  }

  @action
  onGetPokemonResult() async {
    isLoading = true;

    getSharedPokemonList();

    final dataState = await _pokemonResultUseCase();

    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      isCompleted = true;

      result = dataState.data!;
      pokemonResultList = dataState.data!.results!;

      getMorePokemon();
    }

    if (dataState is DataFailed && pokemonList.isEmpty) {
      errorMessage = 'Não foi possível resgatar dados!';
    }

    isLoading = false;
  }

  @action
  Future<void> savePokemonList() async {
    await _saveSharedObject<List<PokemonEntity>>(
      key: sharedListKey,
      value: pokemonList,
    );
  }

  @action
  Future<void> getSharedPokemonList() async {
    pokemonList = await _getSharedList<PokemonEntity>(
          fromJson: PokemonModel.fromJson,
          key: sharedListKey,
        ) ??
        [];
  }

  @action
  Future<void> getSharedFavoritePokemonList() async {
    favoritePokemonList = await _getSharedList<PokemonEntity>(
          fromJson: PokemonModel.fromJson,
          key: sharedFavoriteListKey,
        ) ??
        [];
  }

  @action
  Future<void> removeSharedPokemonList() async {
    await _deleteSharedObject(sharedListKey);
  }

  @action
  Future<void> saveResult() async {
    setPaginationValues(result!);
    await _saveSharedObject<ResultEntity>(
      key: sharedResultKey,
      value: result!,
    );
  }

  @action
  Future<void> getSharedResult() async {
    final result = await _getSharedObject<ResultEntity>(
      key: sharedResultKey,
      fromJson: ResultModel.fromJson,
    );
    if (result != null) isCompleted = true;
  }

  @action
  setPokemonFavorite(PokemonEntity pokemon) async {
    setCanAdd(pokemon);

    if (canAddPokemon) {
      favoritePokemonList = List.from(favoritePokemonList..add(pokemon));
      await _saveSharedObject<List<PokemonEntity>>(
        key: sharedFavoriteListKey,
        value: favoritePokemonList,
      );
    }
  }

  setCanAdd(PokemonEntity pokemon) {
    if (favoritePokemonList.isEmpty) {
      canAddPokemon = true;
    }

    for (var item in favoritePokemonList) {
      if (item.id != pokemon.id) {
        canAddPokemon = true;
      } else {
        canAddPokemon = false;
      }
    }
  }

  setPaginationValues(ResultEntity data) {
    var paginationQuery = StringUtil.splitPaginationUrl(data.next!);
    offset = paginationQuery[0];
    limit = paginationQuery[1];
  }

  @action
  void searchPokemon(String query) {
    searchText = query;
    searchPokemonList = [];
    _searchByType(query);
    _searchByName(query);
    _searchById(query);
  }

  @action
  Future<void> getBatteryLevel() async {
    batteryLevel = await _batteryLevelService.getBatteryLevel();
  }

  _searchByName(String query) {
    for (PokemonEntity it in pokemonList) {
      if (it.name!.contains(query)) {
        searchPokemonList = List.from(searchPokemonList..add(it));
      }
    }
  }

  _searchById(String query) {
    for (PokemonEntity it in pokemonList) {
      if (it.id.toString().contains(query)) {
        searchPokemonList = List.from(searchPokemonList..add(it));
      }
    }
  }

  _searchByType(String query) {
    for (PokemonEntity it in pokemonList) {
      if (it.types[0].type!.name!.contains(query)) {
        if (!it.name!.contains(query)) {
          searchPokemonList = List.from(searchPokemonList..add(it));
        }
      } else {
        if (it.types.length > 1) {
          if (it.types[1].type!.name!.contains(query)) {
            if (!it.name!.contains(query)) {
              searchPokemonList = List.from(searchPokemonList..add(it));
            }
          }
        }
      }
    }
  }

  showToast({
    required String msg,
    Color color = Colors.greenAccent,
    IconData icon = Icons.check,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
