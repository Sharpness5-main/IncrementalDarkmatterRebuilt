import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../variable_provider.dart';

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
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var cpmultipliers = ref.watch(generalcpmultiplierProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var epmultiplier = ref.watch(epmultiplierProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var dmbooster = ref.watch(permaupgDmboosterProvider.notifier);
    var dmboostercost = ref.watch(permaupgDmboosterCostProvider.notifier);
    var dmboostermultiplier =
        ref.watch(permaupgDmboosterMultiplierProvider.notifier);
    if (darkmatter.state >= dmboostercost.state) {
      darkmatter.state -= dmboostercost.state;
      dmbooster.state += 1;
      dmboostercost.state *= 2;
      dmboostermultiplier.state += 0.2;
      cpmultipliers.update((state) =>
          cpmultiplier.state *
          upmultiplier.state *
          epmultiplier.state *
          spmultiplier.state *
          dmboostermultiplier.state);
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
}
