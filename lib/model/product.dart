import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class ProductModel {
  String store;
  String pict;
  String name;
  double basePrice;
  double price;
  String isFavorite;
  int favoriteNumber;
  double rate;
  String desc;

  ProductModel(
      {this.store, this.pict, this.name, this.basePrice, this.price, this.isFavorite, this.favoriteNumber, this.rate, this.desc});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      store : json["store"],
      pict : json["pict"],
      name : json["name"],
      basePrice : json["base_price"],
      price : json["price"],
      isFavorite : json["is_favorite"],
      favoriteNumber : json["favorite_number"],
      rate : json["rate"],
      desc : json["desc"],
    );
  }

  static Future<List<ProductModel>> loadDummyData() async {
    String jsonString =
        await rootBundle.loadString("dummy_data/product.json");
    var jsonObject = json.decode(jsonString);
    List<dynamic> listProduct = (jsonObject as Map<String, dynamic>)['data'];
    List<ProductModel> product = [];
    for (var i = 0; i < listProduct.length; i++) {
      product.add(ProductModel.fromJson(listProduct[i]));
    }
    return product;
  }
}
