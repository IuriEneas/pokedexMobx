import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/auth/domain/entities/result.dart';
import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';

class GetPokemonResultUseCase
    implements Usecase<DataState<ResultEntity>, void> {
  final PokemonRepository _pokemonRepository;

  GetPokemonResultUseCase(this._pokemonRepository);

  @override
  Future<DataState<ResultEntity>> call({void params}) {
    return _pokemonRepository.getNewPokemonResult();
  }
}
