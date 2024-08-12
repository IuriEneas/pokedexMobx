import 'package:pokedex_mobx/features/domain/repository/pokemon_repository.dart';

class GetSharedObject {
  final PokemonRepository _repository;
  GetSharedObject(this._repository);

  Future<T?> call<T>({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return _repository.getSharedObject(key, fromJson);
  }
}
