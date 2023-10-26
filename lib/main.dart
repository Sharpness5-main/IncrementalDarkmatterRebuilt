import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incremental_darkmatter/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: non_constant_identifier_names
  final SharedPreferencesProvider =
      Provider<SharedPreferences>((_) => throw UnimplementedError());
  runApp(ProviderScope(overrides: [
    SharedPreferencesProvider.overrideWithValue(
      await SharedPreferences.getInstance(),
    ),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
