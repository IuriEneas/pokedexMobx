import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/auth/domain/entities/result.dart';
import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';
import 'package:flutter_application_1/features/auth/presentation/stores/home_store.dart';
import 'package:flutter_application_1/injection_container.dart';

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
