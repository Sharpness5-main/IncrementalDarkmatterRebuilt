import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DimensionModel {
  final String id;
  double exmultiplier;
  double multiplier;
  double possession;
  int purchase;
  double cost;

  DimensionModel(this.id, this.exmultiplier, this.multiplier, this.possession,
      this.purchase, this.cost);

  /// Map型に変換
  Map toJson() => {
        "id": id,
        "exmultiplier": exmultiplier,
        "multiplier": multiplier,
        "possession": possession,
        "purchase": purchase,
        "cost": cost,
      };

  /// JSONオブジェクトを代入
  DimensionModel.fromJson(Map json)
      : id = json["id"],
        exmultiplier = json["exmultiplier"],
        multiplier = json["multiplier"],
        possession = json["possession"],
        purchase = json["purchase"],
        cost = json["cost"];
}

class DimensionProvider with ChangeNotifier {
  List<DimensionModel> dimensiondata = [];

  DimensionProvider() {
    syncDataWithProvider();
  }

  void initDimensionData() {
    dimensiondata = [
      DimensionModel("dimension1", 1, 1.0, 0.0, 0, 10.0),
      DimensionModel("dimension2", 12, 1.0, 0.0, 0, 100.0),
      DimensionModel("dimension3", 144, 1.0, 0.0, 0, 1000.0),
    ];
  }

  void setInitialSharedPrefrences() {
    initDimensionData();
    updateSharedPrefrences();
  }

  Future updateSharedPrefrences() async {
    List<String> myData =
        dimensiondata.map((f) => f.toJson().toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("dimensiondata", json.encode(myData));
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = json.decode(prefs.getString('dimensiondata') ?? '');
    if (result != null) {
      dimensiondata = json.decode(prefs.getString('dimensiondata') ?? '');
    } else {
      setInitialSharedPrefrences();
    }
  }
}
