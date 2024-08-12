import 'package:pokedex_mobx/features/auth/domain/repository/pokemon_repository.dart';

class GetSharedList {
  final PokemonRepository _repository;
  GetSharedList(this._repository);

  Future<List<T>?> call<T>({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return _repository.getSharedList(key, fromJson);
  }
}
