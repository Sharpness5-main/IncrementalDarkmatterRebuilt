// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../variable_provider.dart';
import 'settings_notifier.dart';

// ignore: must_be_immutable
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
                  text: '========= Savedata Settings =========',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    settingnotifier.savedata();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      alignment: Alignment.center),
                  child: const Text("Save the game"),
                ),
                ElevatedButton(
                  onPressed: () {
                    settingnotifier.resetdata();
                  },
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
                      'This game has no autosave feature.\nDon\'t forget to save your game!',
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              textAlign: TextAlign.center,
            ),
            RichText(
              text: const TextSpan(
                  text:
                      '- - - - - - - - - - - - - - - - Statistics - - - - - - - - - - - - - - - -',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              textAlign: TextAlign.center,
            ),
            Consumer(builder: (context, ref, child) {
              return RichText(
                text: TextSpan(
                  text: 'You have clicked ',
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: ref.watch(clickcountProvider).round().toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.purple, fontSize: 20),
                    ),
                    const TextSpan(
                      text: ' times.',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              );
            }),
          ])),
    );
  }
}
