import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  void initState() {}
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
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    dmperclick.update((state) =>
        ((cpmultiplier.state * upmultiplier.state * spmultiplier.state) /
            dmsoftcapdiviser.state));
    darkmatter.update((state) => (darkmatter.state +
            (dm1persec.state + dm2persec.state + dm3persec.state) /
                dmsoftcapdiviser.state)
        .round()
        .toDouble());
    if (darkmatter.state >= 50000) {
      sacrificepointincrease.update(
          (state) => (pow((darkmatter.state - 50000), 0.3)).round().toDouble());
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
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    ref.watch(sacrificepointincreaseProvider.notifier);
    dmperclick.update((state) =>
        ((cpmultiplier.state * upmultiplier.state * spmultiplier.state) /
            dmsoftcapdiviser.state));
    darkmatter.update((state) => darkmatter.state + dmperclick.state);
  }

  void reset() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpupgcost = ref.watch(cpupgcostProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upupgcost = ref.watch(upupgcostProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
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
    upupgcost.update((state) => 500);
    cpmultiplier.update((state) => 1);
    upmultiplier.update((state) => 1);
    freecpupg.update((state) => 0);
    freeupupg.update((state) => 0);
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
          15,
          1.0,
          0.0,
          0,
          1000,
        ]);
    dmdim3.update((state) => [
          225,
          1.0,
          0.0,
          0,
          10000,
        ]);
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
          ((pow(1.025, (clickpower.state + freecpupg.state)) *
                      (1 + (clickpower.state + freecpupg.state) * 0.25)) *
                  100)
              .round() /
          100);
    }
    if (clickpower.state <= 15) {
      cpupgcost.update(
          (state) => (30 * pow(1.2, clickpower.state)).round().toDouble());
    } else if (clickpower.state > 15 && clickpower.state <= 40) {
      cpupgcost.update((state) =>
          (30 * 15.41 * pow(1.25, clickpower.state - 15)).round().toDouble());
    } else if (clickpower.state > 40 && clickpower.state <= 75) {
      cpupgcost.update((state) =>
          (30 * 4079 * pow(1.37, clickpower.state - 40)).round().toDouble());
    } else {
      cpupgcost.update((state) =>
          (30 * 248755995 * pow(1.6, clickpower.state - 75))
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
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
    ref.watch(sacrificepointincreaseProvider.notifier);
    if (darkmatter.state >= upupgcost.state) {
      darkmatter.update((state) => darkmatter.state - upupgcost.state);
      upgradepower.update((state) => upgradepower.state + 1);
      freecpupg
          .update((state) => (freecpupg.state + (0.15 * spmultiupg.state)));
      upmultiplier.update((state) =>
          ((pow(1.05, (upgradepower.state + freeupupg.state)) *
                      (1 + (upgradepower.state + freeupupg.state) * 0.4)) *
                  100)
              .round() /
          100);
      cpmultiplier.update((state) =>
          ((pow(1.025, (clickpower.state + freecpupg.state)) *
                      (1 + (clickpower.state + freecpupg.state) * 0.25)) *
                  100)
              .round() /
          100);
    }
    if (upgradepower.state <= 5) {
      upupgcost.update(
          (state) => (500 * pow(1.3, upgradepower.state)).round().toDouble());
    } else if (upgradepower.state > 5 && upgradepower.state <= 15) {
      upupgcost.update((state) =>
          (500 * 3.713 * pow(1.4, upgradepower.state - 5)).round().toDouble());
    } else if (upgradepower.state > 15 && upgradepower.state <= 30) {
      upupgcost.update((state) =>
          (500 * 107.4 * pow(1.55, upgradepower.state - 15))
              .round()
              .toDouble());
    } else {
      upupgcost.update((state) =>
          (500 * 76909 * pow(1.75, upgradepower.state - 30))
              .round()
              .toDouble());
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
            dmdim1.state[1] * 1.2,
            dmdim1.state[2] + 1,
            dmdim1.state[3] + 1,
            dmdim1.state[4] * 1.75,
          ]);
      dm1persec.update((state) =>
          (dmdim1.state[0] * dmdim1.state[1] * dmdim1.state[2]).toDouble());
    }
  }

  void buyDmDim2() {
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dm2persec = ref.watch(dm2persecProvider.notifier);
    if (darkmatter.state >= dmdim2.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim2.state[4]);
      dmdim2.update((state) => [
            dmdim2.state[0],
            dmdim2.state[1] * 1.225,
            dmdim2.state[2] + 1,
            dmdim2.state[3] + 1,
            dmdim2.state[4] * 1.9,
          ]);
      dm2persec.update((state) =>
          (dmdim2.state[0] * dmdim2.state[1] * dmdim2.state[2]).toDouble());
    }
  }

  void buyDmDim3() {
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dm3persec = ref.watch(dm3persecProvider.notifier);
    if (darkmatter.state >= dmdim3.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim3.state[4]);
      dmdim3.update((state) => [
            dmdim3.state[0],
            dmdim3.state[1] * 1.25,
            dmdim3.state[2] + 1,
            dmdim3.state[3] + 1,
            dmdim3.state[4] * 2.25,
          ]);
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
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
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
      sacrificepointincrease.update(
          (state) => (pow((darkmatter.state - 50000), 0.3)).round().toDouble());
      sacrificepoint.update(
          (state) => sacrificepoint.state + sacrificepointincrease.state);
      sacrificecount.update((state) => sacrificecount.state + 1);
      spmultiplier.update((state) =>
          (((1 + sacrificepoint.state * 0.002) *
                      pow(1.02, sacrificecount.state)) *
                  100)
              .round() /
          100);
      spmultiupg.update((state) =>
          (1 + sacrificepoint.state * 0.0012) *
          (1 + 0.0005 * sacrificecount.state));
      clickpower.update((state) => 0);
      dmsoftcapdiviser.update((state) => 1);
      upgradepower.update((state) => 0);
      cpmultiplier.update((state) => 1);
      upmultiplier.update((state) => 1);
      darkmatter.update((state) => 1);
      cpupgcost.update((state) => 30);
      upupgcost.update((state) => 500);
      freecpupg.update((state) => 0);
      freeupupg.update((state) => 0);
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
            15,
            1.0,
            0.0,
            0,
            1000,
          ]);
      dmdim3.update((state) => [
            225,
            1.0,
            0.0,
            0,
            10000,
          ]);
    }
  }
}
