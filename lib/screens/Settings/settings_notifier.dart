// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:async';
import '../../ListObjectSaves/dimension_model.dart';
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
  DimensionProvider dimensionProvider = DimensionProvider();
  SettingRiverpodNotifier(this.ref)
      : super(const SettingRiverpodState(content: 0)) {
    initState();
  }

  final Ref ref;

  void initState() async {
    final prefs = await SharedPreferences.getInstance();
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
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    darkmatter.update((state) => prefs.getDouble('darkmatter') ?? 0);
    dmperclick.update((state) => prefs.getDouble('dmperclick') ?? 1);
    dmsoftcapdiviser
        .update((state) => prefs.getDouble('dmsoftcapdiviser') ?? 1);
    clickpower.update((state) => prefs.getDouble('clickpower') ?? 0);
    cpupgcost.update((state) => prefs.getDouble('cpupgcost') ?? 30);
    cpmultiplier.update((state) => prefs.getDouble('cpmultiplier') ?? 1);
    upgradepower.update((state) => prefs.getDouble('upgradepower') ?? 0);
    upupgcost.update((state) => prefs.getDouble('upupgcost') ?? 400);
    upmultiplier.update((state) => prefs.getDouble('upmultiplier') ?? 1);
    enhancepower.update((state) => prefs.getDouble('enhancepower') ?? 0);
    epupgcost.update((state) => prefs.getDouble('epupgcost') ?? 5000);
    epmultiplier.update((state) => prefs.getDouble('epmultiplier') ?? 1);
    freecpupg.update((state) => prefs.getDouble('freecpupg') ?? 0);
    freeupupg.update((state) => prefs.getDouble('freeupupg') ?? 0);
    freeepupg.update((state) => prefs.getDouble('freeepupg') ?? 0);
    sacrificepoint.update((state) => prefs.getDouble('sacrificepoint') ?? 0);
    spmultiplier.update((state) => prefs.getDouble('spmultiplier') ?? 1);
    spmultiupg.update((state) => prefs.getDouble('spmultiupg') ?? 1);
    sacrificepointincrease
        .update((state) => prefs.getDouble('sacrificepointincrease') ?? 0);
    sacrificecount.update((state) => prefs.getDouble('sacrificecount') ?? 0);
    dm1persec.update((state) => prefs.getDouble('dm1persec') ?? 0);
    dm2persec.update((state) => prefs.getDouble('dm2persec') ?? 0);
    dm3persec.update((state) => prefs.getDouble('dm3persec') ?? 0);
    dimensionProvider.syncDataWithProvider();
  }

  void savedata() async {
    final prefs = await SharedPreferences.getInstance();
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
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    prefs.setDouble('darkmatter', darkmatter.state);
    prefs.setDouble('dmperclick', dmperclick.state);
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
    prefs.setDouble('spmultiupg', spmultiupg.state);
    prefs.setDouble('sacrificepointincrease', sacrificepointincrease.state);
    prefs.setDouble('sacrificecount', sacrificecount.state);
    prefs.setDouble('dm1persec', dm1persec.state);
    prefs.setDouble('dm2persec', dm2persec.state);
    prefs.setDouble('dm3persec', dm3persec.state);
  }

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
