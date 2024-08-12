import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';

class DeleteSharedObject {
  final PokemonRepository _repository;
  DeleteSharedObject(this._repository);

  Future<void> call(String key) {
    return _repository.removeSharedObject(key);
  }
}
