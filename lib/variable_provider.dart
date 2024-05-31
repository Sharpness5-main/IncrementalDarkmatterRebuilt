import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamefpsProvider = StateProvider((ref) => 1.0); //fps
final generalcpmultiplierProvider = StateProvider((ref) => 1.0);
final generaldmpersecProvider = StateProvider((ref) => 0.0);
final darkmatterProvider = StateProvider((ref) => 0.0);
final dmperclickProvider = StateProvider((ref) => 1.0);
final clickcountProvider = StateProvider((ref) => 0.0);
final clickcountmultiplierProvider = StateProvider((ref) => 1.0);
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
final mainupgradesProvider = StateProvider((ref) => 0.0);
final dimensionupgradestrProvider = StateProvider((ref) => [
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
    ]);
final freecpupgProvider = StateProvider((ref) => 0.0);
final freeupupgProvider = StateProvider((ref) => 0.0);
final freeepupgProvider = StateProvider((ref) => 0.0);
final sacrificepointProvider = StateProvider((ref) => 0.0);
final spmultiplierProvider = StateProvider((ref) => 1.0);
final sacrificepointincreaseProvider = StateProvider((ref) => 0.0);
final sacrificecountProvider = StateProvider((ref) => 0.0);
final permaupgDmboosterProvider = StateProvider((ref) => 0.0);
final permaupgDmboosterCostProvider = StateProvider((ref) => 1000.0);
final permaupgDmboosterMultiplierProvider = StateProvider((ref) => 1.0);
final permaupgSpboosterProvider = StateProvider((ref) => 0.0);
final permaupgSpboosterCostProvider = StateProvider((ref) => 50000.0);
final permaupgSpboosterMultiplierProvider = StateProvider((ref) => 1.0);
final dmdim1Provider = StateProvider<List<num>>(
    (ref) => [1, 1.0, 0.0, 0, 100]); //↓格納してる数値は 1stから順に「ex倍率/倍率/所持数/購入数/コスト」
final dmdim2Provider =
    StateProvider<List<num>>((ref) => [12, 1.0, 0.0, 0, 1000]);
final dmdim3Provider =
    StateProvider<List<num>>((ref) => [144, 1.0, 0.0, 0, 10000]);
final dmdim1strProvider = StateProvider<List<String>>((ref) => [
      '1',
      '1.0',
      '0.0',
      '0',
      '100',
    ]);
final dmdim2strProvider = StateProvider<List<String>>((ref) => [
      '12',
      '1.0',
      '0.0',
      '0',
      '1000',
    ]);
final dmdim3strProvider = StateProvider<List<String>>((ref) => [
      '144',
      '1.0',
      '0.0',
      '0',
      '10000',
    ]);
