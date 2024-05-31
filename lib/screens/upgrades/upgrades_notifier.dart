import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../variable_provider.dart';
import '../home/home_notifier.dart';

part 'upgrades_notifier.freezed.dart';

@freezed
class UpgradeRiverpodState with _$UpgradeRiverpodState {
  const factory UpgradeRiverpodState({
    required double darkmatter,
  }) = _UpgradeRiverpodState;
}

final upgradeRiverpodState =
    StateNotifierProvider<UpgradePiverpodNotifier, UpgradeRiverpodState>(
        (ref) => UpgradePiverpodNotifier(ref)..initState());

class UpgradePiverpodNotifier extends StateNotifier<UpgradeRiverpodState> {
  UpgradePiverpodNotifier(this.ref)
      : super(const UpgradeRiverpodState(
          darkmatter: 0,
        )) {
    initState();
  }
  final Ref ref;

  void initState() {}
  void upgradeDMBooster() {
    var homeNotifier = ref.watch(homeRiverpodState.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var cpmultipliers = ref.watch(generalcpmultiplierProvider.notifier);
    var dmbooster = ref.watch(permaupgDmboosterProvider.notifier);
    var dmboostercost = ref.watch(permaupgDmboosterCostProvider.notifier);
    var dmboostermultiplier =
        ref.watch(permaupgDmboosterMultiplierProvider.notifier);
    if (darkmatter.state >= dmboostercost.state) {
      darkmatter.state -= dmboostercost.state;
      dmbooster.state += 1;
      dmboostercost.state *= 2;
      dmboostermultiplier.state += 0.2;
      cpmultipliers.state = homeNotifier.calcMultiplier();
    }
  }

  void upgradeSPBooster() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var spbooster = ref.watch(permaupgSpboosterProvider.notifier);
    var spboostercost = ref.watch(permaupgSpboosterCostProvider.notifier);
    var spboostermultiplier =
        ref.watch(permaupgSpboosterMultiplierProvider.notifier);
    if (darkmatter.state >= spboostercost.state) {
      darkmatter.state -= spboostercost.state;
      spbooster.state += 1;
      spboostercost.state *= 2.5;
      spboostermultiplier.state += 0.1;
    }
  }

  void dimupg1() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var clickcount = ref.watch(clickcountProvider.notifier);
    var clickcountmultiplier = ref.watch(clickcountmultiplierProvider.notifier);
    var dimensionupgrade = ref.watch(dimensionupgradestrProvider.notifier);
    if (darkmatter.state >= 300 && dimensionupgrade.state[0] == "0") {
      darkmatter.state -= 300;
      dimensionupgrade.state[0] = "1";
      clickcountmultiplier.state = 1.0 + sqrt(clickcount.state) * 0.03;
    }
  }

  void dimupg2() {}
  void dimupg3() {}
  void dimupg4() {}
  void dimupg5() {}
  void dimupg6() {}
}
