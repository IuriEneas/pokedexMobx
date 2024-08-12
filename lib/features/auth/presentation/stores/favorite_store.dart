import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/features/auth/domain/entities/pokemon.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/delete_shared_object.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/local/save_shared_object.dart';
import 'package:flutter_application_1/features/auth/presentation/stores/home_store.dart';
import 'package:mobx/mobx.dart';
part 'favorite_store.g.dart';

// ignore: library_private_types_in_public_api
class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  _FavoriteStore(
    this.homeStore,
    this._saveSharedObject,
    this._deleteSharedObject,
  ) {
    pokemon = homeStore.favoritePokemonList;
  }

  final HomeStore homeStore;
  final SaveSharedObject _saveSharedObject;
  final DeleteSharedObject _deleteSharedObject;

  @observable
  List<PokemonEntity> pokemon = [];

  @action
  void removePokemon(int id) {
    pokemon = List.from(pokemon..removeWhere((pokemon) => pokemon.id == id));
    deleteSharedPokemon();
  }

  deleteSharedPokemon() async {
    await _deleteSharedObject(sharedFavoriteListKey);
    await _saveSharedObject<List<PokemonEntity>>(
      key: sharedFavoriteListKey,
      value: pokemon,
    );
  }

  @action
  void fetchPokemon() {
    pokemon = homeStore.favoritePokemonList;
  }
}
