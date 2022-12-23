// To parse this JSON data, do
//
//     final bookDetailModel = bookDetailModelFromJson(jsonString);

import 'dart:convert';

BookDetailModel bookDetailModelFromJson(String str) =>
    BookDetailModel.fromJson(json.decode(str));

class BookDetailModel {
  BookDetailModel({
    required this.status,
    required this.bookDetailData,
  });

  String status;
  BookDetailData bookDetailData;

  factory BookDetailModel.fromJson(Map<String, dynamic> json) =>
      BookDetailModel(
        status: json["status"],
        bookDetailData: BookDetailData.fromJson(json["data"]),
      );
}

class BookDetailData {
  BookDetailData({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.writer,
    required this.publisherId,
    required this.publisher,
    required this.language,
    required this.totalPage,
    required this.createdAt,
    required this.thumbnail,
    required this.rating,
    required this.totalReview,
    required this.genres,
    required this.priceMax,
    required this.priceMin,
  });

  String id;
  String name;
  String synopsis;
  String writer;
  String publisherId;
  String publisher;
  String language;
  int totalPage;
  String createdAt;
  String thumbnail;
  double rating;
  String totalReview;
  List<Genre> genres;
  PriceM? priceMax;
  PriceM? priceMin;

  factory BookDetailData.fromJson(Map<String, dynamic> json) => BookDetailData(
        id: json["id"],
        name: json["name"],
        synopsis: json["synopsis"],
        writer: json["writer"],
        publisherId: json["publisher_id"],
        publisher: json["publisher"],
        language: json["language"],
        totalPage: json["total_page"],
        createdAt: json["created_at"],
        thumbnail: json["thumbnail"],
        rating: json["rating"].toDouble(),
        totalReview: json["total_review"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        priceMax: json["price_max"] != null
            ? PriceM.fromJson(json["price_max"])
            : null,
        priceMin: json["price_min"] != null
            ? PriceM.fromJson(json["price_min"])
            : null,
      );
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class PriceM {
  PriceM({
    required this.type,
    required this.price,
    required this.duration,
  });

  int type;
  int price;
  int duration;

  factory PriceM.fromJson(Map<String, dynamic> json) => PriceM(
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
