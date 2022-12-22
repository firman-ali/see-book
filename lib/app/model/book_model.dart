// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

class BookModel {
  BookModel({
    required this.status,
    required this.bookData,
  });

  String status;
  List<BookDatum> bookData;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        status: json["status"],
        bookData: List<BookDatum>.from(
            json["data"].map((x) => BookDatum.fromJson(x))),
      );
}

class BookDatum {
  BookDatum({
    required this.id,
    required this.name,
    required this.writer,
    required this.rating,
    required this.totalReview,
  });

  String id;
  String name;
  String writer;
  int rating;
  String totalReview;

  factory BookDatum.fromJson(Map<String, dynamic> json) => BookDatum(
        id: json["id"],
        name: json["name"],
        writer: json["writer"],
        rating: json["rating"],
        totalReview: json["total_review"],
      );
}
