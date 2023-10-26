import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../valueable_provider.dart';

class UpgradeScreen extends ConsumerWidget {
  const UpgradeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final upgrade = ref.watch(upgradeRiverpodState);
    //final upgradenotifier = ref.watch(upgradeRiverpodState.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: AppBar(
          title: const Text("Upgrades"),
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Consumer(builder: (context, ref, child) {
              return RichText(
                text: TextSpan(
                  text: 'You have ',
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ref.watch(darkmatterProvider).round().toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.purple, fontSize: 30),
                    ),
                    const TextSpan(
                      text: ' darkmatter.',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              );
            })
          ])),
    );
  }
}
