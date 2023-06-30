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
    var fps = ref.watch(gamefpsProvider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var dmdim1softcap = ref.watch(dmdim1softcapProvider.notifier);
    var dmdim2softcap = ref.watch(dmdim2softcapProvider.notifier);
    var dmdim3softcap = ref.watch(dmdim3softcapProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var sacrificepointincrease =
        ref.watch(sacrificepointincreaseProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
    //各Dimensionの処理
    var dmdim1 = ref.watch(dmdim1Provider.notifier); //list
    var dmdim2 = ref.watch(dmdim2Provider.notifier); //list
    var dmdim3 = ref.watch(dmdim3Provider.notifier); //list
    dmperclick.update((state) =>
        ((cpmultiplier.state * upmultiplier.state * spmultiplier.state) /
            dmsoftcapdiviser.state));
    if ((dmdim1.state[2] * dmdim1.state[1] * dmdim1.state[0]) /
            dmsoftcapdiviser.state >
        5 * dmperclick.state) {
      dmdim1softcap.update((state) => //softcap計算
          pow(
                  ((dmdim1.state[2] * dmdim1.state[1] * dmdim1.state[0]) /
                      dmsoftcapdiviser.state /
                      (dmperclick.state * 5)),
                  1.5)
              .toDouble());
    } else {
      dmdim1softcap.update((state) => 1);
    }
    if (dmdim1.state[2] > 5 * dmdim2.state[2] && dmdim2.state[2] != 0) {
      dmdim2softcap.update((state) =>
          pow((dmdim1.state[2] / (dmdim2.state[2] * 5)), 1.5).toDouble());
    } else {
      dmdim2softcap.update((state) => 1);
    }
    if (dmdim2.state[2] > 5 * dmdim3.state[2] && dmdim3.state[2] != 0) {
      dmdim3softcap.update((state) =>
          pow((dmdim2.state[2] / (dmdim3.state[2] * 5)), 1.5).toDouble());
    } else {
      dmdim3softcap.update((state) => 1);
    }
    darkmatter.update((state) =>
        darkmatter.state +
        ((dmdim1.state[2] * dmdim1.state[1] * dmdim1.state[0]) /
                (dmsoftcapdiviser.state * dmdim1softcap.state)) /
            fps.state);
    dmdim1.update((state) => [
          dmdim1.state[0],
          dmdim1.state[1],
          dmdim1.state[2] +
              ((dmdim2.state[2] * dmdim2.state[1] * dmdim2.state[0]) /
                  (dmsoftcapdiviser.state * dmdim2softcap.state) /
                  fps.state), //dimensionの所持数増加
          dmdim1.state[3],
          dmdim1.state[4]
        ]);
    dmdim2.update((state) => [
          dmdim2.state[0],
          dmdim2.state[1],
          dmdim2.state[2] +
              ((dmdim3.state[2] * dmdim3.state[1] * dmdim3.state[0]) /
                  (dmsoftcapdiviser.state * dmdim3softcap.state) /
                  fps.state),
          dmdim2.state[3],
          dmdim2.state[4]
        ]);
    if (darkmatter.state >= 50000) {
      sacrificepointincrease.update((state) => (pow(
                      (darkmatter.state - 50000),
                      0.25 +
                          0.0015 *
                              ((clickpower.state + freecpupg.state) +
                                  2 * (upgradepower.state + freeupupg.state))) *
                  2.5 +
              0.05 *
                  ((clickpower.state + freecpupg.state) +
                      2 * (upgradepower.state + freeupupg.state)))
          .round()
          .toDouble());
    } else {
      sacrificepointincrease.update((state) => 0);
    }
    if (darkmatter.state >= 214748) {
      dmsoftcapdiviser
          .update((state) => pow((darkmatter.state / 214748), 2.5).toDouble());
    } else {
      dmsoftcapdiviser.update((state) => 1.0);
    }
  }

  void incrementCounter() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var dmsoftcapdiviser = ref.watch(dmsoftcapdiviserProvider.notifier);
//    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
//    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
//    var freecpupg = ref.watch(freecpupgProvider.notifier);
//    var freeupupg = ref.watch(freeupupgProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
//    var sacrificepointincrease =
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
    dmdim1.update((state) => [
          0.8,
          1.0,
          0.0,
          0,
          300,
        ]);
    dmdim2.update((state) => [
          0.4,
          1.0,
          0.0,
          0,
          1500,
        ]);
    dmdim3.update((state) => [
          0.2,
          1.0,
          0.0,
          0,
          7500,
        ]);
  }

  void upgradeClickPower() {
    var darkmatter = ref.watch(darkmatterProvider.notifier);
//    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
    var cpupgcost = ref.watch(cpupgcostProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
//    var upgradepower = ref.watch(upgradepowerProvider.notifier);
//    var upupgcost = ref.watch(upupgcostProvider.notifier);
//    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
//    var freeupupg = ref.watch(freeupupgProvider.notifier);
//    var sacrificepoint = ref.watch(sacrificepointProvider.notifier);
//    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
//    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
//    var sacrificepointincrease =
//        ref.watch(sacrificepointincreaseProvider.notifier);
//    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    if (darkmatter.state >= cpupgcost.state) {
      clickpower.update((state) => clickpower.state + 1);
      cpmultiplier.update((state) =>
          ((pow(1.025, (clickpower.state + freecpupg.state)) *
                      (1 + (clickpower.state + freecpupg.state) * 0.25)) *
                  1000)
              .round() /
          1000);
      darkmatter.update((state) => darkmatter.state - cpupgcost.state);
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
//    var dmperclick = ref.watch(dmperclickProvider.notifier);
    var clickpower = ref.watch(clickpowerProvider.notifier);
//    var cpupgcost = ref.watch(cpupgcostProvider.notifier);
    var cpmultiplier = ref.watch(cpmultiplierProvider.notifier);
    var upgradepower = ref.watch(upgradepowerProvider.notifier);
    var upupgcost = ref.watch(upupgcostProvider.notifier);
    var upmultiplier = ref.watch(upmultiplierProvider.notifier);
    var freecpupg = ref.watch(freecpupgProvider.notifier);
    var freeupupg = ref.watch(freeupupgProvider.notifier);
//    var sacrificepoint = ref.watch(sacrificepointProvider.notifier);
//    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    var spmultiupg = ref.watch(spmultiupgProvider.notifier);
//    var sacrificepointincrease =
    ref.watch(sacrificepointincreaseProvider.notifier);
//    var sacrificecount = ref.watch(sacrificecountProvider.notifier);
    if (darkmatter.state >= upupgcost.state) {
      darkmatter.update((state) => darkmatter.state - upupgcost.state);
      upgradepower.update((state) => upgradepower.state + 1);
      freecpupg
          .update((state) => (freecpupg.state + (0.15 * spmultiupg.state)));
      upmultiplier.update((state) =>
          ((pow(1.05, (upgradepower.state + freeupupg.state)) *
                      (1 + (upgradepower.state + freeupupg.state) * 0.4)) *
                  1000)
              .round() /
          1000);
      cpmultiplier.update((state) =>
          ((pow(1.025, (clickpower.state + freecpupg.state)) *
                      (1 + (clickpower.state + freecpupg.state) * 0.25)) *
                  1000)
              .round() /
          1000);
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
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    if (darkmatter.state >= dmdim1.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim1.state[4]);
      dmdim1.update((state) => [
            dmdim1.state[0],
            dmdim1.state[1],
            dmdim1.state[2] + 1,
            dmdim1.state[3] + 1,
            dmdim1.state[4],
          ]);
      dmdim1.update((state) => [
            dmdim1.state[0],
            dmdim1.state[0] *
                pow(1.2, dmdim1.state[3]) * //倍率計算とコスト計算
                pow(spmultiplier.state, 0.85),
            dmdim1.state[2],
            dmdim1.state[3],
            300 * pow(1.6, dmdim1.state[3]),
          ]);
    }
  }

  void buyDmDim2() {
    var dmdim2 = ref.watch(dmdim2Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    if (darkmatter.state >= dmdim2.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim2.state[4]);
      dmdim2.update((state) => [
            dmdim2.state[0],
            dmdim2.state[1],
            dmdim2.state[2] + 1,
            dmdim2.state[3] + 1,
            dmdim2.state[4],
          ]);
      dmdim2.update((state) => [
            dmdim2.state[0],
            dmdim2.state[0] *
                pow(1.2, dmdim2.state[3]) *
                pow(spmultiplier.state, 0.85),
            dmdim2.state[2],
            dmdim2.state[3],
            1500 * pow(1.75, dmdim2.state[3]),
          ]);
    }
  }

  void buyDmDim3() {
    var dmdim3 = ref.watch(dmdim3Provider.notifier);
    var darkmatter = ref.watch(darkmatterProvider.notifier);
    var spmultiplier = ref.watch(spmultiplierProvider.notifier);
    if (darkmatter.state >= dmdim3.state[4]) {
      darkmatter.update((state) => darkmatter.state - dmdim3.state[4]);
      dmdim3.update((state) => [
            dmdim3.state[0],
            dmdim3.state[1],
            dmdim3.state[2] + 1,
            dmdim3.state[3] + 1,
            dmdim3.state[4],
          ]);
      dmdim3.update((state) => [
            dmdim3.state[0],
            dmdim3.state[0] *
                pow(1.2, dmdim3.state[3]) *
                pow(spmultiplier.state, 0.85),
            dmdim3.state[2],
            dmdim3.state[3],
            7500 * pow(1.9, dmdim3.state[3]),
          ]);
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
    if (darkmatter.state >= 50000) {
      sacrificepointincrease.update((state) => (pow(
                      (darkmatter.state - 50000),
                      0.25 +
                          0.0015 *
                              ((clickpower.state + freecpupg.state) +
                                  2 * (upgradepower.state + freeupupg.state))) *
                  2.5 +
              0.05 *
                  ((clickpower.state + freecpupg.state) +
                      2 * (upgradepower.state + freeupupg.state)))
          .round()
          .toDouble());
      sacrificepoint.update(
          (state) => sacrificepoint.state + sacrificepointincrease.state);
      sacrificecount.update((state) => sacrificecount.state + 1);
      spmultiplier.update((state) =>
          (((1 + sacrificepoint.state * 0.002) *
                      pow(1.02, sacrificecount.state)) *
                  1000)
              .round() /
          1000);
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
      dmdim1.update((state) => [
            0.8,
            1.0,
            0.0,
            0,
            300,
          ]);
      dmdim2.update((state) => [
            0.4,
            1.0,
            0.0,
            0,
            1500,
          ]);
      dmdim3.update((state) => [
            0.2,
            1.0,
            0.0,
            0,
            7500,
          ]);
    }
  }
}
