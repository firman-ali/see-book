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
    required this.rating,
    required this.totalReview,
    required this.genres,
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
  int rating;
  String totalReview;
  List<Genre> genres;

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
        rating: json["rating"],
        totalReview: json["total_review"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
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
}
