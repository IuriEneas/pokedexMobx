import 'package:dio/dio.dart';
import 'package:pokedex_mobx/features/data/data_sources/local/battery_level_service.dart';
import 'package:pokedex_mobx/features/data/data_sources/remote/pokemon_api_service.dart';
import 'package:pokedex_mobx/features/data/repository/pokemon_repository.dart';
import 'package:pokedex_mobx/features/domain/repository/pokemon_repository.dart';
import 'package:pokedex_mobx/features/domain/usecases/local/delete_shared_object.dart';
import 'package:pokedex_mobx/features/domain/usecases/local/get_shared_list.dart';
import 'package:pokedex_mobx/features/domain/usecases/local/get_shared_object.dart';
import 'package:pokedex_mobx/features/domain/usecases/get_more_pokemon_result.dart';
import 'package:pokedex_mobx/features/domain/usecases/get_pokemon.dart';
import 'package:pokedex_mobx/features/domain/usecases/get_pokemon_result.dart';
import 'package:pokedex_mobx/features/domain/usecases/local/save_shared_object.dart';
import 'package:pokedex_mobx/features/presentation/stores/favorite_store.dart';
import 'package:pokedex_mobx/features/presentation/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencia de conexão http
  getIt.registerSingleton<Dio>(Dio());

  // Dependencia Bateria service
  getIt.registerSingleton<BatteryLevelService>(
    BatteryLevelService(),
  );

  // Dependencia shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Dependencia conexão da Api
  getIt.registerSingleton<PokemonApiService>(
    PokemonApiService(getIt()),
  );

  // Dependencia do repository
  getIt.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(getIt(), getIt()),
  );

  // Dependencia de casos de uso
  getIt.registerSingleton<GetPokemonResultUseCase>(
    GetPokemonResultUseCase(getIt()),
  );
  getIt.registerSingleton<GetMorePokemonResultUseCase>(
    GetMorePokemonResultUseCase(getIt()),
  );
  getIt.registerSingleton<GetPokemonUseCase>(
    GetPokemonUseCase(getIt()),
  );
  getIt.registerSingleton<SaveSharedObject>(
    SaveSharedObject(getIt()),
  );
  getIt.registerSingleton<GetSharedList>(
    GetSharedList(getIt()),
  );
  getIt.registerSingleton<GetSharedObject>(
    GetSharedObject(getIt()),
  );
  getIt.registerSingleton<DeleteSharedObject>(
    DeleteSharedObject(getIt()),
  );

  // Dependencia Mobx e telas

  getIt.registerLazySingleton<HomeStore>(
    () => HomeStore(
      getIt<GetPokemonResultUseCase>(),
      getIt<GetMorePokemonResultUseCase>(),
      getIt<GetPokemonUseCase>(),
      getIt<BatteryLevelService>(),
      getIt<GetSharedObject>(),
      getIt<GetSharedList>(),
      getIt<SaveSharedObject>(),
      getIt<DeleteSharedObject>(),
    ),
  );

  getIt.registerLazySingleton<FavoriteStore>(
    () => FavoriteStore(
      getIt<HomeStore>(),
      getIt<SaveSharedObject>(),
      getIt<DeleteSharedObject>(),
    ),
  );
}
