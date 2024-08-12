import 'package:pokedex_mobx/core/resources/data_state.dart';
import 'package:pokedex_mobx/core/usecases/usecase.dart';
import 'package:pokedex_mobx/features/domain/entities/result.dart';
import 'package:pokedex_mobx/features/domain/repository/pokemon_repository.dart';
import 'package:pokedex_mobx/features/presentation/stores/home_store.dart';
import 'package:pokedex_mobx/injection_container.dart';

class GetMorePokemonResultUseCase
    implements Usecase<DataState<ResultEntity>, void> {
  final PokemonRepository _pokemonRepository;

  GetMorePokemonResultUseCase(this._pokemonRepository);

  @override
  Future<DataState<ResultEntity>> call({void params}) {
    HomeStore homeStore = getIt<HomeStore>();

    return _pokemonRepository.getMorePokemonResult(
      homeStore.offset,
      homeStore.limit,
    );
  }
}
