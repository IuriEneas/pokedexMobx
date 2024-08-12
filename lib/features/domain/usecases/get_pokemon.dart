import 'package:pokedex_mobx/core/resources/data_state.dart';
import 'package:pokedex_mobx/core/usecases/usecase.dart';
import 'package:pokedex_mobx/features/domain/entities/pokemon.dart';
import 'package:pokedex_mobx/features/domain/repository/pokemon_repository.dart';
import 'package:pokedex_mobx/features/presentation/stores/home_store.dart';
import 'package:pokedex_mobx/injection_container.dart';

class GetPokemonUseCase implements Usecase<DataState<PokemonEntity>, void> {
  final PokemonRepository _pokemonRepository;

  GetPokemonUseCase(this._pokemonRepository);

  @override
  Future<DataState<PokemonEntity>> call({void params}) {
    HomeStore homeStore = getIt();

    return _pokemonRepository.getNewPokemon(homeStore.currentPokemonName);
  }
}
