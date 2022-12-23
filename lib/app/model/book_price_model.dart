// To parse this JSON data, do
//
//     final bookPriceModel = bookPriceModelFromJson(jsonString);

import 'dart:convert';

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
  List<ListPrice> listPrice;

  factory PriceData.fromJson(Map<String, dynamic> json) => PriceData(
        id: json["id"],
        book: json["book"],
        listPrice: List<ListPrice>.from(
            json["list_price"].map((x) => ListPrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "book": book,
        "list_price": List<dynamic>.from(listPrice.map((x) => x.toJson())),
      };
}

class ListPrice {
  ListPrice({
    required this.type,
    required this.price,
    required this.duration,
  });

  int type;
  int price;
  int duration;

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        type: json["type"],
        price: json["price"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "duration": duration,
      };
}
