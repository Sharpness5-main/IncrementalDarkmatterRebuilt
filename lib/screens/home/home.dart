import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../valueable_provider.dart';
import 'home_notifier.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final state = ref.watch(homeRiverpodState);
    final homenotifier = ref.watch(homeRiverpodState.notifier);
    var dmChangeDetectStream = ref.watch(darkmatterProvider.notifier).stream;
    StreamBuilder<num>(
      stream: dmChangeDetectStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: AppBar(
          title: const Text("Incremental Darkmatter pre_release"),
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
            ElevatedButton(
              onPressed: homenotifier.incrementCounter,
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(175, 45), alignment: Alignment.center),
              child: const Text("Increase Darkmatter"),
            ),
            Consumer(builder: (context, ref, child) {
              return RichText(
                text: TextSpan(
                  text: 'Your production : ',
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                  children: <TextSpan>[
                    TextSpan(
                      text: ((ref.watch(dmperclickProvider) * 1000).round() /
                              1000)
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.purple, fontSize: 17),
                    ),
                    const TextSpan(
                      text: ' DM/click   ',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    TextSpan(
                      text: ((((ref.watch(dmdim1Provider)[2] *
                                              ref.watch(dmdim1Provider)[1] *
                                              ref.watch(dmdim1Provider)[0]) /
                                          ref.watch(dmsoftcapdiviserProvider) /
                                          ref.watch(dmdim1softcapProvider)) *
                                      1000)
                                  .round() /
                              1000)
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.purple, fontSize: 17),
                    ),
                    const TextSpan(
                      text: ' DM/sec',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              );
            }),
            if (ref.watch(dmsoftcapdiviserProvider) > 1.0)
              Consumer(builder: (context, ref, child) {
                return RichText(
                  text: TextSpan(
                    text:
                        'Above 214748 darkmatters, your production will be divided by',
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: ((ref.watch(dmsoftcapdiviserProvider) * 10000)
                                    .round() /
                                10000)
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.red, fontSize: 18),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                );
              }),
            if (ref.watch(dmsoftcapdiviserProvider) <= 1.0)
              const SizedBox(height: 20),
            if (ref.watch(dmdim1softcapProvider) +
                    ref.watch(dmdim2softcapProvider) +
                    ref.watch(dmdim3softcapProvider) >
                3.0)
              Text(
                "Because of dim softcap,your dim is weakened. (Border : 5x)",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.red, fontSize: 14),
              ),
            if (ref.watch(dmdim1softcapProvider) +
                    ref.watch(dmdim2softcapProvider) +
                    ref.watch(dmdim3softcapProvider) <=
                3.0)
              const SizedBox(height: 17),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Consumer(builder: (context, ref, child) {
                    return RichText(
                        text: TextSpan(
                      text: 'ClickPower\n',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "${ref.watch(clickpowerProvider).round()}+${((ref.watch(freecpupgProvider) * 100).round() / 100)}",
                          style: const TextStyle(
                              color: Colors.purple, fontSize: 18),
                        ),
                      ],
                    ));
                  }),
                  Text("Multi: ${ref.watch(cpmultiplierProvider)}x"),
                  Text("Cost: ${ref.watch(cpupgcostProvider).round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.upgradeClickPower,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(90, 35),
                        alignment: Alignment.center),
                    child: const Text("Upgrade"),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Consumer(builder: (context, ref, child) {
                    return RichText(
                        text: TextSpan(
                      text: 'Upgraded CP\n',
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "${ref.watch(upgradepowerProvider).round()}+${ref.watch(freeupupgProvider)}",
                          style: const TextStyle(
                              color: Colors.purple, fontSize: 18),
                        ),
                      ],
                    ));
                  }),
                  Text("Multi: ${ref.watch(upmultiplierProvider)}x"),
                  Text("Cost: ${ref.watch(upupgcostProvider).round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.upgradeUpgradePower,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(90, 35),
                        alignment: Alignment.center),
                    child: const Text("Upgrade"),
                  ),
                ]),
            RichText(
              text: const TextSpan(
                  text:
                      '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              textAlign: TextAlign.center,
            ),
            Consumer(builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                      "1st Dim\n /${(ref.watch(dmdim1softcapProvider) * ref.watch(dmsoftcapdiviserProvider) * 100).round() / 100}"),
                  Text(
                      "${(ref.watch(dmdim1Provider)[0] * ref.watch(dmdim1Provider)[1] * 100 / ref.watch(dmdim1softcapProvider) / ref.watch(dmsoftcapdiviserProvider)).round() / 100}x"),
                  Text("  ${ref.watch(dmdim1Provider)[2].round()}"),
                  Text("Cost ${ref.watch(dmdim1Provider)[4].round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.buyDmDim1,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 30),
                        alignment: Alignment.center),
                    child: const Text("Buy"),
                  ),
                ],
              );
            }),
            Consumer(builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                      "2nd Dim\n /${(ref.watch(dmdim2softcapProvider) * ref.watch(dmsoftcapdiviserProvider) * 100).round() / 100}"),
                  Text(
                      "${(ref.watch(dmdim2Provider)[0] * ref.watch(dmdim2Provider)[1] * 100 / ref.watch(dmdim2softcapProvider) / ref.watch(dmsoftcapdiviserProvider)).round() / 100}x"),
                  Text("  ${ref.watch(dmdim2Provider)[2].round()}"),
                  Text("Cost ${ref.watch(dmdim2Provider)[4].round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.buyDmDim2,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 30),
                        alignment: Alignment.center),
                    child: const Text("Buy"),
                  ),
                ],
              );
            }),
            Consumer(builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                      "3rd Dim\n /${(ref.watch(dmdim3softcapProvider) * ref.watch(dmsoftcapdiviserProvider) * 100).round() / 100}"),
                  Text(
                      "${(ref.watch(dmdim3Provider)[0] * ref.watch(dmdim3Provider)[1] * 100 / ref.watch(dmdim3softcapProvider) / ref.watch(dmsoftcapdiviserProvider)).round() / 100}x"),
                  Text("  ${ref.watch(dmdim3Provider)[2].round()}"),
                  Text("Cost ${ref.watch(dmdim3Provider)[4].round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.buyDmDim3,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 30),
                        alignment: Alignment.center),
                    child: const Text("Buy"),
                  ),
                ],
              );
            }),
            // Consumer(builder: (context, ref, child) {
            //   return Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: <Widget>[
            //       const Text("4th Dim"),
            //       Text(
            //           "${(ref.watch(dmdim4Provider)[0] * ref.watch(dmdim4Provider)[1] * 100).round() / 100}x"),
            //       Text("  ${ref.watch(dmdim4Provider)[2].round()}"),
            //       Text("Cost ${ref.watch(dmdim4Provider)[4].round()}"),
            //       ElevatedButton(
            //         onPressed: homenotifier.buyDmDim4,
            //         style: ElevatedButton.styleFrom(
            //             fixedSize: const Size(70, 30),
            //             alignment: Alignment.center),
            //         child: const Text("Buy"),
            //       ),
            //     ],
            //   );
            // }),
            RichText(
              text: const TextSpan(
                  text:
                      '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              textAlign: TextAlign.center,
            ),
            RichText(
              text: const TextSpan(
                  text: 'Darkmatter Sacrifice',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: homenotifier.darkmatterSacrifice,
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50), alignment: Alignment.center),
              child: const Text(
                  "Soft Reset and get Sacrifice Points\nCost: 50000 Darkmatter at least"),
            ),
            Consumer(builder: (context, ref, child) {
              return RichText(
                text: TextSpan(
                  text: 'You can get ',
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(
                      text: ref
                          .watch(sacrificepointincreaseProvider)
                          .round()
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.purple, fontSize: 18),
                    ),
                    const TextSpan(
                      text: ' sacrifice points now.',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              );
            }),
            Text(
                "You have done sacrifice ${ref.watch(sacrificecountProvider).round()} times."),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Consumer(builder: (context, ref, child) {
                    return RichText(
                        text: TextSpan(
                      text: 'Sacrifice point: ',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: ref
                              .watch(sacrificepointProvider)
                              .round()
                              .toString(),
                          style: const TextStyle(
                              color: Colors.purple, fontSize: 16),
                        ),
                      ],
                    ));
                  }),
                  Text("DM Multi: ${ref.watch(spmultiplierProvider)}x"),
                  Text(
                      "Upg Multi: ${((ref.watch(spmultiupgProvider)) * 1000).round() / 1000}x"),
                ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homenotifier.reset,
        child: const Text("RESET"),
      ),
    );
  }
}
