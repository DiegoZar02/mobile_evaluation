import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_evaluation/models/scan.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlacesProvider extends ChangeNotifier {
  List<String> _places = [];

  List<String> get places {
    return _places;
  }

  Future<List<String>> getPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList("ids") ?? [];
    _places = list;
    return list;
  }

  Future<void> setPlaces(List<String> id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("ids", [...(prefs.getStringList("ids") ?? []), ...id]);
    places = id;
  }

  set places(List<String> id) {
    _places = id;
    notifyListeners();
  }

  Future<List<ScanModel>> readJson() async {
    final String res = await rootBundle.loadString("assets/data.json");
    final List info = await json.decode(res);
    return info.map((i) => ScanModel.fromJson(i)).toList();
  }

  Future<List<ScanModel>> displayPlaces() async {
    final String res = await rootBundle.loadString("assets/data.json");
    final List info = await json.decode(res);
    List<ScanModel> listPlaces =
        info.map((i) => ScanModel.fromJson(i)).toList();

    final ids = (await getPlaces()).map((int.parse)).toList();

    final placesList =
        listPlaces.where((element) => ids.contains(element.id)).toList();

    return placesList;
  }
}
