// To parse this JSON data, do
//
//     final bookPriceModel = bookPriceModelFromJson(jsonString);

import 'dart:convert';

import 'package:see_book_app/app/model/book_detail_model.dart';

BookPriceModel bookPriceModelFromJson(String str) =>
    BookPriceModel.fromJson(json.decode(str));

class BookPriceModel {
  BookPriceModel({
    required this.status,
    required this.priceData,
  });

  String status;
  PriceData priceData;

  factory BookPriceModel.fromJson(Map<String, dynamic> json) => BookPriceModel(
        status: json["status"],
        priceData: PriceData.fromJson(json["data"]),
      );
}

class PriceData {
  PriceData({
    required this.id,
    required this.book,
    required this.listPrice,
  });

  String id;
  String book;
  List<PriceM> listPrice;

  factory PriceData.fromJson(Map<String, dynamic> json) => PriceData(
        id: json["id"],
        book: json["book"],
        listPrice: List<PriceM>.from(
            json["list_price"].map((x) => PriceM.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "book": book,
        "list_price": List<dynamic>.from(listPrice.map((x) => x.toJson())),
      };
}
