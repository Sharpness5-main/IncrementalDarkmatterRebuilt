// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math';
import 'dart:async';
import '../../valueable_provider.dart';
part 'settings_notifier.freezed.dart';

@freezed
class SettingRiverpodState with _$SettingRiverpodState {
  const factory SettingRiverpodState({
    required int content,
  }) = _SettingRiverpodState;
}

final settingRiverpodState =
    StateNotifierProvider<SettingRiverpodNotifier, SettingRiverpodState>(
        (ref) => SettingRiverpodNotifier(ref)..initState());

class SettingRiverpodNotifier extends StateNotifier<SettingRiverpodState> {
  SettingRiverpodNotifier(this.ref)
      : super(const SettingRiverpodState(content: 0)) {
    initState();
  }

  final Ref ref;

  void initState() {}
  void savedata() {}
  void resetdata() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpupgcost = ref.watch(cpupgcostProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upupgcost = ref.watch(upupgcostProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var enhancepower = ref.watch(enhancepowerProvider.notifier);
    var epupgcost = ref.watch(epupgcostProvider.notifier);
    var epmultiplier = ref.watch(epmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
    var freeepupg = ref.watch(freeepupgProvider.notifier);
    var sacrificepoint = ref.watch(sacrificepointProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    darkmatter.update((state) => 0);
    dmperclick.update((state) => 1);
    dmsoftcapdiviser.update((state) => 1);
    clickpower.update((state) => 0);
    cpupgcost.update((state) => 30);
    upgradepower.update((state) => 0);
    upupgcost.update((state) => 400);
    enhancepower.update((state) => 0);
    epupgcost.update((state) => 5000);
    cpmultiplier.update((state) => 1);
    upmultiplier.update((state) => 1);
    epmultiplier.update((state) => 1);
    freecpupg.update((state) => 0);
    freeupupg.update((state) => 0);
    freeepupg.update((state) => 0);
    sacrificepoint.update((state) => 0);
    spmultiplier.update((state) => 1);
    spmultiupg.update((state) => 1);
    sacrificepointincrease.update((state) => 0);
    sacrificecount.update((state) => 0);
    dm1persec.update((state) => 0);
    dm2persec.update((state) => 0);
    dm3persec.update((state) => 0);
    dmdim1.update((state) => [
          1,
          1.0,
          0.0,
          0,
          100,
        ]);
    dmdim2.update((state) => [
          12,
          1.0,
          0.0,
          0,
          1000,
        ]);
    dmdim3.update((state) => [
          144,
          1.0,
          0.0,
          0,
          10000,
        ]);
  }
}
