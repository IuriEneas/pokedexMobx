import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';

class SaveSharedObject {
  final PokemonRepository _repository;
  SaveSharedObject(this._repository);

  Future<void> call<T>({required String key, required T value}) {
    return _repository.saveSharedObject(value, key);
  }
}
