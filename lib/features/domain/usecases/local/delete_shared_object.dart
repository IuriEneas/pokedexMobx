import 'package:pokedex_mobx/features/domain/repository/pokemon_repository.dart';

class DeleteSharedObject {
  final PokemonRepository _repository;
  DeleteSharedObject(this._repository);

  Future<void> call(String key) {
    return _repository.removeSharedObject(key);
  }
}
