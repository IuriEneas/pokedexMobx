import 'package:dio/dio.dart';
import 'package:pokedex_mobx/core/constants/constants.dart';
import 'package:pokedex_mobx/features/data/models/pokemon.dart';
import 'package:pokedex_mobx/features/data/models/result.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'pokemon_api_service.g.dart';

@RestApi(baseUrl: pokeApiBaseUrl)
abstract class PokemonApiService {
  factory PokemonApiService(Dio dio) = _PokemonApiService;

  @GET('/pokemon')
  Future<HttpResponse<ResultModel>> getPokemonResult({
    @Query("limit") String? limit,
    @Query("offset") String? offset,
  });

  @GET('/pokemon/{name}')
  Future<HttpResponse<PokemonModel>> getPokemon({
    @Path("name") required String pokemon,
  });
}
