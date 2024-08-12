import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/features/auth/data/data_sources/remote/pokemon_api_service.dart';
import 'package:flutter_application_1/features/auth/data/models/pokemon.dart';
import 'package:flutter_application_1/features/auth/data/models/result.dart';
import 'package:flutter_application_1/features/auth/domain/repository/pokemon_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonApiService _pokemonApiService;
  final SharedPreferences sharedPreferences;
  PokemonRepositoryImpl(this._pokemonApiService, this.sharedPreferences);

  @override
  Future<DataState<PokemonModel>> getNewPokemon(String pokemon) async {
    try {
      final httpResponse =
          await _pokemonApiService.getPokemon(pokemon: pokemon);

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

  @override
  Future<DataState<ResultModel>> getNewPokemonResult() async {
    try {
      final httpResponse = await _pokemonApiService.getPokemonResult();

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

  @override
  Future<DataState<ResultModel>> getMorePokemonResult(
    String offset,
    String limit,
  ) async {
    try {
      final httpResponse = await _pokemonApiService.getPokemonResult(
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

  @override
  Future<T?> getSharedObject<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    String? jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  @override
  Future<void> removeSharedObject(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> saveSharedObject<T>(T value, String key) async {
    final jsonObject = json.encode(value);
    await sharedPreferences.setString(key, jsonObject);
  }

  @override
  Future<List<T>?> getSharedList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    String? jsonString = sharedPreferences.getString(key);

    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((item) => fromJson(item)).toList();
    }

    return null;
  }
}
