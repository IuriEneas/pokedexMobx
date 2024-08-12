import 'package:pokedex_mobx/core/resources/data_state.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/pokemon.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/result.dart';

abstract class PokemonRepository {
  Future<DataState<PokemonEntity>> getNewPokemon(String pokemon);
  Future<DataState<ResultEntity>> getNewPokemonResult();
  Future<DataState<ResultEntity>> getMorePokemonResult(
    String offset,
    String limit,
  );
  Future<void> saveSharedObject<T>(T value, String key);
  Future<T?> getSharedObject<T>(
      String key, T Function(Map<String, dynamic>) fromJson);
  Future<List<T>?> getSharedList<T>(
      String key, T Function(Map<String, dynamic>) fromJson);
  Future<void> removeSharedObject(String key);
}
