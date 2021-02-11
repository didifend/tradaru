import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class CategoriesModel {
  String pict;
  String name;

  CategoriesModel(
      {this.pict,
      this.name});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      pict: json["pict"],
      name: json["name"]
    );
  }

  static Future<List<CategoriesModel>> loadDummyData() async {
    String jsonString =
        await rootBundle.loadString("dummy_data/categories.json");
    var jsonObject = json.decode(jsonString);
    List<dynamic> listKategori = (jsonObject as Map<String, dynamic>)['data'];
    List<CategoriesModel> kategori = [];
    for (var i = 0; i < listKategori.length; i++) {
      kategori.add(CategoriesModel.fromJson(listKategori[i]));
    }
    return kategori;
  }
}
