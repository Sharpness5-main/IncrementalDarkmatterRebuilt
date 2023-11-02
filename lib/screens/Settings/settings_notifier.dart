// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:async';
import '../../variable_provider.dart';
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

  void savedata() async {
    final prefs = await SharedPreferences.getInstance();
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var cpmultipliers = ref.watch(generalcpmultiplierProvider.notifier);
    var dmpersec = ref.watch(generaldmpersecProvider.notifier);
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
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var dmdim1str = ref.watch(dmdim1strProvider.notifier);
    var dmdim2str = ref.watch(dmdim2strProvider.notifier);
    var dmdim3str = ref.watch(dmdim3strProvider.notifier);
    var dmbooster = ref.watch(permaupgDmboosterProvider.notifier);
    var dmboostercost = ref.watch(permaupgDmboosterCostProvider.notifier);
    var dmboostermultiplier =
        ref.watch(permaupgDmboosterMultiplierProvider.notifier);
    var spbooster = ref.watch(permaupgSpboosterProvider.notifier);
    var spboostercost = ref.watch(permaupgSpboosterCostProvider.notifier);
    var spboostermultiplier =
        ref.watch(permaupgSpboosterMultiplierProvider.notifier);
    prefs.setDouble('darkmatter', darkmatter.state);
    prefs.setDouble('dmperclick', dmperclick.state);
    prefs.setDouble('cpmultipliers', cpmultipliers.state);
    prefs.setDouble('dmpersec', dmpersec.state);
    prefs.setDouble('dmsoftcapdiviser', dmsoftcapdiviser.state);
    prefs.setDouble('clickpower', clickpower.state);
    prefs.setDouble('cpupgcost', cpupgcost.state);
    prefs.setDouble('cpmultiplier', cpmultiplier.state);
    prefs.setDouble('upgradepower', upgradepower.state);
    prefs.setDouble('upupgcost', upupgcost.state);
    prefs.setDouble('upmultiplier', upmultiplier.state);
    prefs.setDouble('enhancepower', enhancepower.state);
    prefs.setDouble('epupgcost', epupgcost.state);
    prefs.setDouble('epmultiplier', epmultiplier.state);
    prefs.setDouble('freecpupg', freecpupg.state);
    prefs.setDouble('freeupupg', freeupupg.state);
    prefs.setDouble('freeepupg', freeepupg.state);
    prefs.setDouble('sacrificepoint', sacrificepoint.state);
    prefs.setDouble('spmultiplier', spmultiplier.state);
    prefs.setDouble('sacrificepointincrease', sacrificepointincrease.state);
    prefs.setDouble('sacrificecount', sacrificecount.state);
    prefs.setDouble('dm1persec', dm1persec.state);
    prefs.setDouble('dm2persec', dm2persec.state);
    prefs.setDouble('dm3persec', dm3persec.state);
    prefs.setDouble('dmbooster', dmbooster.state);
    prefs.setDouble('dmboostercost', dmboostercost.state);
    prefs.setDouble('dmboostermultiplier', dmboostermultiplier.state);
    prefs.setDouble('spbooster', spbooster.state);
    prefs.setDouble('spboostercost', spboostercost.state);
    prefs.setDouble('spboostermultiplier', spboostermultiplier.state);
    dmdim1str.update((state) => [
          dmdim1.state[0].toString(),
          dmdim1.state[1].toString(),
          dmdim1.state[2].toString(),
          dmdim1.state[3].toString(),
          dmdim1.state[4].toString(),
        ]);
    dmdim2str.update((state) => [
          dmdim2.state[0].toString(),
          dmdim2.state[1].toString(),
          dmdim2.state[2].toString(),
          dmdim2.state[3].toString(),
          dmdim2.state[4].toString(),
        ]);
    dmdim3str.update((state) => [
          dmdim3.state[0].toString(),
          dmdim3.state[1].toString(),
          dmdim3.state[2].toString(),
          dmdim3.state[3].toString(),
          dmdim3.state[4].toString(),
        ]);
    prefs.setStringList('dmdim1', dmdim1str.state);
    prefs.setStringList('dmdim2', dmdim2str.state);
    prefs.setStringList('dmdim3', dmdim3str.state);
  }

  void resetdata() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var cpmultipliers = ref.watch(generalcpmultiplierProvider.notifier);
    var dmpersec = ref.watch(generaldmpersecProvider.notifier);
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
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var dmdim1str = ref.watch(dmdim1strProvider.notifier);
    var dmdim2str = ref.watch(dmdim2strProvider.notifier);
    var dmdim3str = ref.watch(dmdim3strProvider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    var dmbooster = ref.watch(permaupgDmboosterProvider.notifier);
    var dmboostercost = ref.watch(permaupgDmboosterCostProvider.notifier);
    var dmboostermultiplier =
        ref.watch(permaupgDmboosterMultiplierProvider.notifier);
    var spbooster = ref.watch(permaupgSpboosterProvider.notifier);
    var spboostercost = ref.watch(permaupgSpboosterCostProvider.notifier);
    var spboostermultiplier =
        ref.watch(permaupgSpboosterMultiplierProvider.notifier);
    darkmatter.update((state) => 0);
    dmperclick.update((state) => 1);
    cpmultipliers.update((state) => 1);
    dmpersec.update((state) => 0);
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
    dmdim1str.update((state) => [
          '1',
          '1.0',
          '0.0',
          '0',
          '100',
        ]);
    dmdim2str.update((state) => [
          '12',
          '1.0',
          '0.0',
          '0',
          '1000',
        ]);
    dmdim3str.update((state) => [
          '144',
          '1.0',
          '0.0',
          '0',
          '10000',
        ]);
    dmbooster.update((state) => 0);
    dmboostercost.update((state) => 1000);
    dmboostermultiplier.update((state) => 1);
    spbooster.update((state) => 0);
    spboostercost.update((state) => 50000);
    spboostermultiplier.update((state) => 1);
  }
}
