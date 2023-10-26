// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../valueable_provider.dart';
import 'settings_notifier.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingnotifier = ref.watch(settingRiverpodState.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: AppBar(
          title: const Text("Settings"),
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                  text: 'Incremental Darkmatter by Sharpness5',
                  style: TextStyle(color: Colors.black, fontSize: 24)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                  text: 'Savedata settings',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: settingnotifier.savedata,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      alignment: Alignment.center),
                  child: const Text("Save the game"),
                ),
                ElevatedButton(
                  onPressed: settingnotifier.resetdata,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      alignment: Alignment.center),
                  child: const Text("RESET THE GAME"),
                )
              ],
            ),
            RichText(
              text: const TextSpan(
                  text:
                      'This game has no autosave feature. Don\'t forget to save your game!\nResetting the game will delete all your progress with no secrets.',
                  style: TextStyle(color: Colors.red, fontSize: 12)),
              textAlign: TextAlign.center,
            )
          ])),
    );
  }
}
