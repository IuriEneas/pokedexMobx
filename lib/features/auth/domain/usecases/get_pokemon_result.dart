import 'package:pokedex_mobx/core/resources/data_state.dart';
import 'package:pokedex_mobx/core/usecases/usecase.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/result.dart';
import 'package:pokedex_mobx/features/auth/domain/repository/pokemon_repository.dart';

class GetPokemonResultUseCase
    implements Usecase<DataState<ResultEntity>, void> {
  final PokemonRepository _pokemonRepository;

  GetPokemonResultUseCase(this._pokemonRepository);

  @override
  Future<DataState<ResultEntity>> call({void params}) {
    return _pokemonRepository.getNewPokemonResult();
  }
}
