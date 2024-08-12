import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/auth/domain/entities/pokemon.dart';
import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';
import 'package:flutter_application_1/features/auth/presentation/stores/home_store.dart';
import 'package:flutter_application_1/injection_container.dart';

class GetPokemonUseCase implements Usecase<DataState<PokemonEntity>, void> {
  final PokemonRepository _pokemonRepository;

  GetPokemonUseCase(this._pokemonRepository);

  @override
  Future<DataState<PokemonEntity>> call({void params}) {
    HomeStore homeStore = getIt();

    return _pokemonRepository.getNewPokemon(homeStore.currentPokemonName);
  }
}
