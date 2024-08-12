import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:pokedex_mobx/core/constants/constants.dart';
import 'package:pokedex_mobx/features/auth/data/models/result.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  Future<void> saveResultShared(ResultEntity result) async {
    final shared = await SharedPreferences.getInstance();
    final jsonPokemon = json.encode(result);
    await shared.setString(sharedResultKey, jsonPokemon);
  }

  Future<ResultEntity?> getResultShared() async {
    final shared = await SharedPreferences.getInstance();
    final String? jsonString = shared.getString(sharedResultKey);
    final jsonDecoded = jsonString == null ? '' : json.decode(jsonString);

    return jsonString == null ? null : ResultModel.fromJson(jsonDecoded);
  }

  Future<void> removeResultShared() async {
    final shared = await SharedPreferences.getInstance();
    await shared.remove(sharedResultKey);
  }

  Future<void> saveSharedObject<T>(T value, String key) async {
    final shared = await SharedPreferences.getInstance();
    final jsonObject = json.encode(value);
    await shared.setString(sharedListKey, jsonObject);
  }

  Future<T?> getSharedObject<T>(
      String key, T Function(Map<String, T>) fromJson) async {
    final shared = await SharedPreferences.getInstance();
    String? jsonString = shared.getString(key);
    if (jsonString != null) {
      Map<String, T> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late SharedPreferencesService sharedPreferencesService;

  setUp(() {
    sharedPreferencesService = SharedPreferencesService();
  });

  test(
    'Deve salvar o result e resgatar no SharedPreferences',
    () async {
      SharedPreferences.setMockInitialValues({});
      await sharedPreferencesService.saveResultShared(
        const ResultEntity(
          count: 10,
          next: 'next',
          previous: 'previous',
          results: [],
        ),
      );

      final ResultEntity? result =
          await sharedPreferencesService.getResultShared();

      expect(result, isNotNull);
    },
  );

  test(
    'Deve remover o item do shared Preferences e tentar resgatar Nulo',
    () async {
      SharedPreferences.setMockInitialValues({});
      await sharedPreferencesService.removeResultShared();

      final ResultEntity? result =
          await sharedPreferencesService.getResultShared();

      expect(result, isNull);
    },
  );
}
