// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:pokedex_mobx/core/constants/constants.dart';
import 'package:pokedex_mobx/features/auth/data/models/result.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  late final resultShared = ResultSharedPreferences();
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  test(
    'Deve retornar uma lista com todos os pokemon local',
    () async {
      final ResultEntity? result =
          await resultShared.getResultShared(sharedPreferences);

      expect(result, result?.count);
    },
  );
}

class ResultSharedPreferences {
  Future<ResultEntity?> getResultShared(
      SharedPreferences sharedPreferences) async {
    final String jsonString =
        sharedPreferences.getString(sharedResultKey) ?? '{}';
    final jsonDecoded = json.decode(jsonString);

    return jsonString.isEmpty ? null : ResultModel.fromJson(jsonDecoded);
  }
}
