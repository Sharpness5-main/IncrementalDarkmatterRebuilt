import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AchievementScreen extends ConsumerWidget {
  const AchievementScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: AppBar(
          title: const Text("Achievements"),
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Consumer(builder: (context, ref, child) {
              return RichText(
                text: const TextSpan(
                    text: 'Not implemented yet.',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                textAlign: TextAlign.center,
              );
            })
          ])),
    );
  }
}
