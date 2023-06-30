import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamefpsProvider = StateProvider((ref) => 30.0); //fps
final darkmatterProvider = StateProvider((ref) => 0.0);
final dmperclickProvider = StateProvider((ref) => 1.0);
final dmsoftcapdiviserProvider = StateProvider((ref) => 1.0);
final clickpowerProvider = StateProvider((ref) => 0.0);
final cpupgcostProvider = StateProvider((ref) => 30.0);
final cpmultiplierProvider = StateProvider((ref) => 1.0);
final upgradepowerProvider = StateProvider((ref) => 0.0);
final upupgcostProvider = StateProvider((ref) => 500.0);
final upmultiplierProvider = StateProvider((ref) => 1.0);
final freecpupgProvider = StateProvider((ref) => 0.0);
final freeupupgProvider = StateProvider((ref) => 0.0);
final sacrificepointProvider = StateProvider((ref) => 0.0);
final spmultiplierProvider = StateProvider((ref) => 1.0);
final spmultiupgProvider = StateProvider((ref) => 1.0);
final sacrificepointincreaseProvider = StateProvider((ref) => 0.0);
final sacrificecountProvider =
    StateProvider((ref) => 0.0); //↓格納してる数値は 1stから順に「ex倍率/倍率/所持数/購入数/コスト」
final dmdim1Provider =
    StateProvider<List<num>>((ref) => [0.8, 1.0, 0.0, 0, 300]);
final dmdim2Provider =
    StateProvider<List<num>>((ref) => [0.4, 1.0, 0.0, 0, 1500]);
final dmdim3Provider =
    StateProvider<List<num>>((ref) => [0.2, 1.0, 0.0, 0, 7500]);
final dmdim1softcapProvider = StateProvider((ref) => 1.0);
final dmdim2softcapProvider = StateProvider((ref) => 1.0);
final dmdim3softcapProvider = StateProvider((ref) => 1.0);
