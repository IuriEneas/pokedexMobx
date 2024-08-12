import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/features/auth/data/models/pokemon.dart';
import 'package:flutter_application_1/features/auth/data/models/result.dart';
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
