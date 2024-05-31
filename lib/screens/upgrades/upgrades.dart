import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../variable_provider.dart';
import 'upgrades_notifier.dart';

class UpgradeScreen extends ConsumerWidget {
  const UpgradeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upgradenotifier = ref.watch(upgradeRiverpodState.notifier);
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
            }),
            RichText(
              text: const TextSpan(
                  text:
                      '- - - - - - - - - - - - - Permanent Upgrades - - - - - - - - - - - - - -',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Consumer(builder: (context, ref, child) {
                  return RichText(
                      text: TextSpan(
                    text: 'DM Booster\nLv.',
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${ref.watch(permaupgDmboosterProvider).round()}",
                        style:
                            const TextStyle(color: Colors.purple, fontSize: 18),
                      ),
                    ],
                  ));
                }),
                Text(
                    "DM Multi: ${(ref.watch(permaupgDmboosterMultiplierProvider) * 100).round() / 100}x"),
                ElevatedButton(
                  onPressed: upgradenotifier.upgradeDMBooster,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 35),
                      alignment: Alignment.center),
                  child: Text(
                      "Cost: ${(ref.watch(permaupgDmboosterCostProvider)).round()}"),
                )
              ],
            ),
            if (ref.watch(sacrificecountProvider) >= 1)
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Consumer(builder: (context, ref, child) {
                      return RichText(
                          text: TextSpan(
                        text: 'SP Booster\nLv.',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "${ref.watch(permaupgSpboosterProvider).round()}",
                            style: const TextStyle(
                                color: Colors.purple, fontSize: 18),
                          ),
                        ],
                      ));
                    }),
                    Text(
                        "SP Multi: ${(ref.watch(permaupgSpboosterMultiplierProvider) * 100).round() / 100}x"),
                    ElevatedButton(
                      onPressed: upgradenotifier.upgradeSPBooster,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 35),
                          alignment: Alignment.center),
                      child: Text(
                          "Cost: ${(ref.watch(permaupgSpboosterCostProvider)).round()}"),
                    ),
                  ]),
            RichText(
              text: const TextSpan(
                  text:
                      '- - - - - - - - - - - - Dimensional Upgrades - - - - - - - - - - - - -',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg1,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                          text: TextSpan(
                        text:
                            'Multiplier to DM gain based on clickcount\nCost: 300DM\n',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        children: <TextSpan>[
                          if (ref.watch(dimensionupgradestrProvider)[0] == "0")
                            const TextSpan(
                              text: "Currently: Locked",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 12),
                            )
                          else
                            TextSpan(
                              text:
                                  "Currently: ${(ref.watch(clickcountmultiplierProvider) * 100).round() / 100} x",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                        ],
                      )),
                    ),
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg2,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                          text: TextSpan(
                        text: 'Unlock 1st dimension\nCost: 1000DM\n',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        children: <TextSpan>[
                          if (ref.watch(dimensionupgradestrProvider)[1] == "0")
                            const TextSpan(
                              text: "Currently: Locked",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 12),
                            )
                          else
                            const TextSpan(
                              text: "Currently: Unlocked",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                        ],
                      )),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg3,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Multiplier to 1st dimension based on clickcount\nCost: 3000DM\n',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          children: <TextSpan>[
                            if (ref.watch(dimensionupgradestrProvider)[2] ==
                                "0")
                              const TextSpan(
                                text: "Currently: Locked",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 12),
                              )
                            else
                              TextSpan(
                                text:
                                    "Currently: ${(ref.watch(clickcountmultiplierProvider) * 100).round() / 100} x",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg3,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Improve DM Booster formula\n+0.2x -> +0.3x\nCost: 10000DM\n',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          children: <TextSpan>[
                            if (ref.watch(dimensionupgradestrProvider)[3] ==
                                "0")
                              const TextSpan(
                                text: "Currently: Locked",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 12),
                              )
                            else
                              const TextSpan(
                                text: "Currently: Unlocked",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg3,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                        text: TextSpan(
                          text: 'Unlock CP Upgrader\nCost: 20000DM\n',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          children: <TextSpan>[
                            if (ref.watch(dimensionupgradestrProvider)[4] ==
                                "0")
                              const TextSpan(
                                text: "Currently: Locked",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 12),
                              )
                            else
                              const TextSpan(
                                text: "Currently: Unlocked",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: upgradenotifier.dimupg3,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 90),
                          alignment: Alignment.center),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Reduce the cost scaling of ClickPower\nCost: 50000DM\n',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          children: <TextSpan>[
                            if (ref.watch(dimensionupgradestrProvider)[5] ==
                                "0")
                              const TextSpan(
                                text: "Currently: Locked",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 12),
                              )
                            else
                              const TextSpan(
                                text: "Currently: Unlocked",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ])),
    );
  }
}
