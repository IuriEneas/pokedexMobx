import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_mobx/config/theme/app_theme.dart';
import 'package:pokedex_mobx/features/auth/presentation/pages/home/home_page.dart';
import 'package:pokedex_mobx/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomePage(),
    );
  }
}
