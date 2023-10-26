import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incremental_darkmatter/screens/Achievements/achievements.dart';
import 'package:incremental_darkmatter/screens/Settings/settings.dart';
import 'package:incremental_darkmatter/screens/home/home.dart';
import 'package:incremental_darkmatter/screens/upgrades/upgrades.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      routes: {
        '/upgrades': (context) => const UpgradeScreen(),
        '/achievements': (context) => const AchievementScreen(),
        '/settings': (context) => const SettingScreen(),
        '/main': (context) => const Home(),
      },
    );
  }
}
