import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:async';

import '../../valueable_provider.dart';
part 'home_notifier.freezed.dart';

@freezed
class HomeRiverpodState with _$HomeRiverpodState {
  const factory HomeRiverpodState({
    required int count,
  }) = _HomeRiverpodState;
}

double logBase(num x, num base) => log(x) / log(base);

final homeRiverpodState =
    StateNotifierProvider<HomeRiverpodNotifier, HomeRiverpodState>(
        (ref) => HomeRiverpodNotifier(ref)..initState());

class HomeRiverpodNotifier extends StateNotifier<HomeRiverpodState> {
  HomeRiverpodNotifier(this.ref)
      : super(const HomeRiverpodState(
          count: 1,
        )) {
    initState();
    updateProcess();
  }
  // HomeRiverpodNotifier(this.ref):super(const HomeRiverpodState()){initState();}
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
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var dmdim1str = ref.watch(dmdim1strProvider.notifier);
    var dmdim2str = ref.watch(dmdim2strProvider.notifier);
    var dmdim3str = ref.watch(dmdim3strProvider.notifier);
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
    dmdim1str.update((state) =>
        prefs.getStringList('dmdim1') ??
        [
          '1',
          '1.0',
          '0.0',
          '0',
          '100',
        ]);
    dmdim2str.update((state) =>
        prefs.getStringList('dmdim2') ??
        [
          '12',
          '1.0',
          '0.0',
          '0',
          '1000',
        ]);
    dmdim3str.update((state) =>
        prefs.getStringList('dmdim3') ??
        [
          '144',
          '1.0',
          '0.0',
          '0',
          '10000',
        ]);
    dmdim1.update((state) => [
          num.parse(dmdim1str.state[0]),
          num.parse(dmdim1str.state[1]),
          num.parse(dmdim1str.state[2]),
          num.parse(dmdim1str.state[3]),
          num.parse(dmdim1str.state[4]),
        ]);
    dmdim2.update((state) => [
          num.parse(dmdim2str.state[0]),
          num.parse(dmdim2str.state[1]),
          num.parse(dmdim2str.state[2]),
          num.parse(dmdim2str.state[3]),
          num.parse(dmdim2str.state[4]),
        ]);
    dmdim3.update((state) => [
          num.parse(dmdim3str.state[0]),
          num.parse(dmdim3str.state[1]),
          num.parse(dmdim3str.state[2]),
          num.parse(dmdim3str.state[3]),
          num.parse(dmdim3str.state[4]),
        ]);
  }

  void updateProcess() {
    //ここが常時実行(要するにゲームループ)
    var fps = ref.watch(gamefpsProvider.notifier);
    int fpsToMilliseconds = 1000 ~/ fps.state;
    Timer.periodic(
      Duration(milliseconds: fpsToMilliseconds), //valuable_provider.dart で変更可能
      flameUpdate,
    );
  }

  void flameUpdate(Timer timer) {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var epmultiplier = ref.watch(epmultiplierProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    dmperclick.update((state) => ((cpmultiplier.state *
            upmultiplier.state *
            epmultiplier.state *
            spmultiplier.state) /
        dmsoftcapdiviser.state));
    darkmatter.update((state) => (darkmatter.state +
        ((dm1persec.state + dm2persec.state + dm3persec.state) *
                spmultiplier.state) /
            dmsoftcapdiviser.state));
    if (darkmatter.state >= 50000) {
      sacrificepointincrease.update((state) =>
          (pow((darkmatter.state - 50000), 0.4) *
                  (1 + sacrificecount.state * 0.05))
              .round()
              .toDouble());
    } else {
      sacrificepointincrease.update((state) => 0);
    }
    if (darkmatter.state >= 214748) {
      dmsoftcapdiviser
          .update((state) => pow((darkmatter.state / 214748), 2).toDouble());
    } else {
      dmsoftcapdiviser.update((state) => 1.0);
    }
  }

  void incrementCounter() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var epmultiplier = ref.watch(epmultiplierProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    ref.watch(sacrificepointincreaseProvider.notifier);
    dmperclick.update((state) => ((cpmultiplier.state *
            upmultiplier.state *
            epmultiplier.state *
            spmultiplier.state) /
        dmsoftcapdiviser.state));
    darkmatter.update((state) => darkmatter.state + dmperclick.state);
    if (darkmatter.state >= 214748) {
      dmsoftcapdiviser
          .update((state) => pow((darkmatter.state / 214748), 2).toDouble());
    } else {
      dmsoftcapdiviser.update((state) => 1.0);
    }
  }

  void upgradeClickPower() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpupgcost = ref.watch(cpupgcostProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    if (darkmatter.state >= cpupgcost.state) {
      darkmatter.update((state) => darkmatter.state - cpupgcost.state);
      clickpower.update((state) => clickpower.state + 1);
      cpmultiplier.update((state) =>
          (pow(1.02, (clickpower.state + freecpupg.state)) *
              (1 + (clickpower.state + freecpupg.state) * 0.2)));
    }
    if (clickpower.state <= 15) {
      cpupgcost.update(
          (state) => (30 * pow(1.15, clickpower.state)).round().toDouble());
    } else if (clickpower.state > 15 && clickpower.state <= 40) {
      cpupgcost.update((state) =>
          (30 * 8.137 * pow(1.25, clickpower.state - 15)).round().toDouble());
    } else if (clickpower.state > 40 && clickpower.state <= 75) {
      cpupgcost.update((state) =>
          (30 * 2154 * pow(1.4, clickpower.state - 40)).round().toDouble());
    } else {
      cpupgcost.update((state) =>
          (30 * 280367034 * pow(1.6, clickpower.state - 75))
              .round()
              .toDouble());
    }
  }

  void upgradeUpgradePower() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upupgcost = ref.watch(upupgcostProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var enhancepower = ref.watch(enhancepowerProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
    ref.watch(sacrificepointincreaseProvider.notifier);
    if (darkmatter.state >= upupgcost.state) {
      darkmatter.update((state) => darkmatter.state - upupgcost.state);
      upgradepower.update((state) => upgradepower.state + 1);
      freecpupg.update((state) =>
          (((enhancepower.state * (0.20 * spmultiupg.state) +
                      (upgradepower.state + freeupupg.state) *
                          (0.15 * spmultiupg.state))) *
                  100)
              .round() /
          100);
      upmultiplier.update((state) =>
          (pow(1.035, (upgradepower.state + freeupupg.state)) *
              (1 + (upgradepower.state + freeupupg.state) * 0.3)));
      cpmultiplier.update((state) =>
          ((pow(1.02, (clickpower.state + freecpupg.state)) *
                      (1 + (clickpower.state + freecpupg.state) * 0.2)) *
                  100)
              .round() /
          100);
    }
    if (upgradepower.state <= 10) {
      upupgcost.update(
          (state) => (400 * pow(1.25, upgradepower.state)).round().toDouble());
    } else if (upgradepower.state > 10 && upgradepower.state <= 25) {
      upupgcost.update((state) =>
          (400 * 9.313 * pow(1.4, upgradepower.state - 10)).round().toDouble());
    } else if (upgradepower.state > 25 && upgradepower.state <= 50) {
      upupgcost.update((state) =>
          (400 * 1448.8 * pow(1.6, upgradepower.state - 25))
              .round()
              .toDouble());
    } else {
      upupgcost.update((state) =>
          (400 * 183657219 * pow(1.8, upgradepower.state - 50))
              .round()
              .toDouble());
    }
  }

  void upgradeEnhancePower() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
    var freeepupg = ref.watch(freeepupgProvider.notifier);
    var enhancepower = ref.watch(enhancepowerProvider.notifier);
    var epupgcost = ref.watch(epupgcostProvider.notifier);
    var epmultiplier = ref.watch(epmultiplierProvider.notifier);
    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
    ref.watch(sacrificepointincreaseProvider.notifier);
    if (darkmatter.state >= epupgcost.state) {
      darkmatter.update((state) => darkmatter.state - epupgcost.state);
      enhancepower.update((state) => enhancepower.state + 1);
      freeupupg.update((state) =>
          (((enhancepower.state * (0.15 * spmultiupg.state))) * 100).round() /
          100);
      freecpupg.update((state) =>
          (((enhancepower.state * (0.2 * spmultiupg.state) +
                      (upgradepower.state + freeupupg.state) *
                          (0.15 * spmultiupg.state))) *
                  100)
              .round() /
          100);
      epmultiplier.update((state) =>
          (pow(1.05, (enhancepower.state + freeepupg.state)) *
              (1 + (enhancepower.state + freeepupg.state) * 0.4)));
      upmultiplier.update((state) =>
          (pow(1.035, (upgradepower.state + freeupupg.state)) *
              (1 + (upgradepower.state + freeupupg.state) * 0.3)));
      cpmultiplier.update((state) =>
          (pow(1.02, (clickpower.state + freecpupg.state)) *
              (1 + (clickpower.state + freecpupg.state) * 0.2)));
    }
    if (enhancepower.state <= 4) {
      epupgcost.update(
          (state) => (5000 * pow(1.3, enhancepower.state)).round().toDouble());
    } else if (enhancepower.state > 4 && enhancepower.state <= 12) {
      epupgcost.update((state) =>
          (5000 * 2.856 * pow(1.5, enhancepower.state - 4)).round().toDouble());
    } else if (enhancepower.state > 12 && enhancepower.state <= 25) {
      epupgcost.update((state) =>
          (5000 * 73.196 * pow(1.7, enhancepower.state - 12))
              .round()
              .toDouble());
    } else {
      epupgcost.update((state) =>
          (5000 * 72497 * pow(2, enhancepower.state - 25)).round().toDouble());
    }
  }

  void buyDmDim1() {
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    if (darkmatter.state >= dmdim1.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim1.state[4]);
      dmdim1.update((state) => [
            dmdim1.state[0],
            dmdim1.state[1] * 1.25,
            dmdim1.state[2] + 1,
            dmdim1.state[3] + 1,
            dmdim1.state[4] * 1.4,
          ]);
      dm1persec.update((state) =>
          (dmdim1.state[0] * dmdim1.state[1] * dmdim1.state[2]).toDouble());
    }
  }

  void buyDmDim2() {
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    if (darkmatter.state >= dmdim2.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim2.state[4]);
      dmdim2.update((state) => [
            dmdim2.state[0],
            dmdim2.state[1] * 1.3,
            dmdim2.state[2] + 1,
            dmdim2.state[3] + 1,
            dmdim2.state[4] * 1.65,
          ]);
      dmdim1.update((state) => [
            dmdim1.state[0],
            dmdim1.state[1],
            dmdim1.state[2] + 1,
            dmdim1.state[3],
            dmdim1.state[4],
          ]);
      dm1persec.update((state) =>
          (dmdim1.state[0] * dmdim1.state[1] * dmdim1.state[2]).toDouble());
      dm2persec.update((state) =>
          (dmdim2.state[0] * dmdim2.state[1] * dmdim2.state[2]).toDouble());
    }
  }

  void buyDmDim3() {
    var dmdim1 = ref.watch(dmdim1Provider.notifier);
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dm1persec = ref.watch(dm1persecProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    if (darkmatter.state >= dmdim3.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim3.state[4]);
      dmdim3.update((state) => [
            dmdim3.state[0],
            dmdim3.state[1] * 1.35,
            dmdim3.state[2] + 1,
            dmdim3.state[3] + 1,
            dmdim3.state[4] * 1.9,
          ]);
      dmdim2.update((state) => [
            dmdim2.state[0],
            dmdim2.state[1],
            dmdim2.state[2] + 1,
            dmdim2.state[3],
            dmdim2.state[4],
          ]);
      dmdim1.update((state) => [
            dmdim1.state[0],
            dmdim1.state[1],
            dmdim1.state[2] + 2,
            dmdim1.state[3],
            dmdim1.state[4],
          ]);
      dm1persec.update((state) =>
          (dmdim1.state[0] * dmdim1.state[1] * dmdim1.state[2]).toDouble());
      dm2persec.update((state) =>
          (dmdim2.state[0] * dmdim2.state[1] * dmdim2.state[2]).toDouble());
      dm3persec.update((state) =>
          (dmdim3.state[0] * dmdim3.state[1] * dmdim3.state[2]).toDouble());
    }
  }

  void darkmatterSacrifice() {
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
    if (darkmatter.state >= 50000) {
      sacrificepointincrease.update((state) =>
          (pow((darkmatter.state - 50000), 0.4) *
                  (1 + sacrificecount.state * 0.05))
              .round()
              .toDouble());
      sacrificepoint.update(
          (state) => sacrificepoint.state + sacrificepointincrease.state);
      sacrificecount.update((state) => sacrificecount.state + 1);
      spmultiplier.update((state) =>
          (((1 + sacrificepoint.state * 0.004) *
                      pow(1.015, sacrificecount.state)) *
                  100)
              .round() /
          100);
      spmultiupg.update((state) =>
          (1 + sacrificepoint.state * 0.002) *
          (1 + 0.0004 * sacrificecount.state));
      clickpower.update((state) => 0);
      dmsoftcapdiviser.update((state) => 1);
      upgradepower.update((state) => 0);
      enhancepower.update((state) => 0);
      cpmultiplier.update((state) => 1);
      upmultiplier.update((state) => 1);
      epmultiplier.update((state) => 1);
      darkmatter.update((state) => 0);
      cpupgcost.update((state) => 30);
      upupgcost.update((state) => 400);
      epupgcost.update((state) => 5000);
      freecpupg.update((state) => 0);
      freeupupg.update((state) => 0);
      freeepupg.update((state) => 0);
      sacrificepointincrease.update((state) => 0);
      dmperclick.update((state) =>
          ((cpmultiplier.state * upmultiplier.state * spmultiplier.state) /
              dmsoftcapdiviser.state));
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
}
