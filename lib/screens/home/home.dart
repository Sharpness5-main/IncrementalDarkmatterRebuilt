import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../variable_provider.dart';
import 'home_notifier.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
//    final state = ref.watch(homeRiverpodState);
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
          title: const Text("Incremental Darkmatter"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 55,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text(
                  'Incremental Darkmatter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40), alignment: Alignment.center),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              icon: const Icon(Icons.star),
              label: const Text('Achievements'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40), alignment: Alignment.center),
              onPressed: () {
                Navigator.pushNamed(context, '/achievements');
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Upgrades'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40), alignment: Alignment.center),
              onPressed: () {
                Navigator.pushNamed(context, '/upgrades');
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_left_sharp),
              label: const Text('Close'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40), alignment: Alignment.center),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
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
                      text:
                          ((ref.watch(dmperclickProvider) * 100).round() / 100)
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
                      text: ((((((ref.watch(dm1persecProvider) +
                                                  ref.watch(dm2persecProvider) +
                                                  ref.watch(
                                                      dm3persecProvider))) *
                                              ref.watch(spmultiplierProvider)) /
                                          ref.watch(dmsoftcapdiviserProvider)) *
                                      100)
                                  .round() /
                              100)
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
                        text: ((ref.watch(dmsoftcapdiviserProvider) * 100)
                                    .round() /
                                100)
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
                  Text(
                      "Multi: ${(ref.watch(cpmultiplierProvider) * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                  Text("Cost: ${ref.watch(cpupgcostProvider).round()}"),
                  ElevatedButton(
                    onPressed: homenotifier.upgradeClickPower,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(90, 35),
                        alignment: Alignment.center),
                    child: const Text("Upgrade"),
                  ),
                ]),
            if (ref.watch(mainupgradesProvider) >= 2.0)
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Consumer(builder: (context, ref, child) {
                      return RichText(
                          text: TextSpan(
                        text: 'CP Upgrader\n',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13),
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
                    Text(
                        "Multi: ${(ref.watch(upmultiplierProvider) * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                    Text("Cost: ${ref.watch(upupgcostProvider).round()}"),
                    ElevatedButton(
                      onPressed: homenotifier.upgradeUpgradePower,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(90, 35),
                          alignment: Alignment.center),
                      child: const Text("Upgrade"),
                    ),
                  ]),
            if (ref.watch(mainupgradesProvider) >= 4.0)
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Consumer(builder: (context, ref, child) {
                      return RichText(
                          text: TextSpan(
                        text: 'CP Enhancer\n',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "${ref.watch(enhancepowerProvider).round()}+${((ref.watch(freeepupgProvider) * 100).round() / 100)}",
                            style: const TextStyle(
                                color: Colors.purple, fontSize: 18),
                          ),
                        ],
                      ));
                    }),
                    Text(
                        "Multi: ${(ref.watch(epmultiplierProvider) * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                    Text("Cost: ${ref.watch(epupgcostProvider).round()}"),
                    ElevatedButton(
                      onPressed: homenotifier.upgradeEnhancePower,
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
            if (ref.watch(mainupgradesProvider) < 1.0)
              RichText(
                text: const TextSpan(
                    text:
                        'Dimensions are locked.\nYou can unlock them via upgrades.',
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                textAlign: TextAlign.center,
              ),
            if (ref.watch(mainupgradesProvider) >= 1.0)
              Consumer(builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text("1st Dim"),
                    Text(
                        "${(ref.watch(dmdim1Provider)[0] * ref.watch(dmdim1Provider)[1] * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                    Text(
                        "${ref.watch(dmdim1Provider)[2].round()}[${ref.watch(dmdim1Provider)[3]}]"),
                    Text("Cost: ${ref.watch(dmdim1Provider)[4].round()}"),
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
            if (ref.watch(mainupgradesProvider) >= 3.0)
              Consumer(builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text("2nd Dim"),
                    Text(
                        "${(ref.watch(dmdim2Provider)[0] * ref.watch(dmdim2Provider)[1] * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                    Text(
                        "${ref.watch(dmdim2Provider)[2].round()}[${ref.watch(dmdim2Provider)[3]}]"),
                    Text("Cost: ${ref.watch(dmdim2Provider)[4].round()}"),
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
            if (ref.watch(mainupgradesProvider) >= 5.0)
              Consumer(builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text("3rd Dim"),
                    Text(
                        "${(ref.watch(dmdim3Provider)[0] * ref.watch(dmdim3Provider)[1] * ref.watch(spmultiplierProvider) * 100).round() / 100}x"),
                    Text(
                        "${ref.watch(dmdim3Provider)[2].round()}[${ref.watch(dmdim3Provider)[3]}]"),
                    Text("Cost: ${ref.watch(dmdim3Provider)[4].round()}"),
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
                ]),
          ],
        ),
      ),
    );
  }
}
