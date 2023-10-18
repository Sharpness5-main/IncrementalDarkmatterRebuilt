import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamefpsProvider = StateProvider((ref) => 1.0); //fps
final darkmatterProvider = StateProvider((ref) => 0.0);
final dmperclickProvider = StateProvider((ref) => 1.0);
final dm1persecProvider = StateProvider((ref) => 0.0);
final dm2persecProvider = StateProvider((ref) => 0.0);
final dm3persecProvider = StateProvider((ref) => 0.0);
final dmsoftcapdiviserProvider = StateProvider((ref) => 1.0);
final clickpowerProvider = StateProvider((ref) => 0.0);
final cpupgcostProvider = StateProvider((ref) => 30.0);
final cpmultiplierProvider = StateProvider((ref) => 1.0);
final upgradepowerProvider = StateProvider((ref) => 0.0);
final upupgcostProvider = StateProvider((ref) => 400.0);
final upmultiplierProvider = StateProvider((ref) => 1.0);
final enhancepowerProvider = StateProvider((ref) => 0.0);
final epupgcostProvider = StateProvider((ref) => 5000.0);
final epmultiplierProvider = StateProvider((ref) => 1.0);
final freecpupgProvider = StateProvider((ref) => 0.0);
final freeupupgProvider = StateProvider((ref) => 0.0);
final freeepupgProvider = StateProvider((ref) => 0.0);
final sacrificepointProvider = StateProvider((ref) => 0.0);
final spmultiplierProvider = StateProvider((ref) => 1.0);
final spmultiupgProvider = StateProvider((ref) => 1.0);
final sacrificepointincreaseProvider = StateProvider((ref) => 0.0);
final sacrificecountProvider =
    StateProvider((ref) => 0.0); //↓格納してる数値は 1stから順に「ex倍率/倍率/所持数/購入数/コスト」
final dmdim1Provider = StateProvider<List<num>>((ref) => [1, 1.0, 0.0, 0, 100]);
final dmdim2Provider =
    StateProvider<List<num>>((ref) => [15, 1.0, 0.0, 0, 1000]);
final dmdim3Provider =
    StateProvider<List<num>>((ref) => [225, 1.0, 0.0, 0, 10000]);
