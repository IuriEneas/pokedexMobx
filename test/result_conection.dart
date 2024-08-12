import 'package:dio/dio.dart';
import 'package:pokedex_mobx/core/resources/data_state.dart';
import 'package:pokedex_mobx/features/auth/data/data_sources/remote/pokemon_api_service.dart';
import 'package:pokedex_mobx/features/auth/data/models/result.dart';
import 'package:flutter_test/flutter_test.dart';

class TestConnection {
  Future<DataState<ResultModel>> getMorePokemonResult(
    String offset,
    String limit,
  ) async {
    try {
      final pokemonApiService = PokemonApiService(Dio());

      final httpResponse = await pokemonApiService.getPokemonResult(
        limit: limit,
        offset: offset,
      );

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            type: DioExceptionType.connectionError,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

void main() {
  test('Teste de conexão', () async {
    TestConnection testConnection = TestConnection();

    final response = await testConnection.getMorePokemonResult('10', '10');

    expect(response, isNotNull);
  });
}
