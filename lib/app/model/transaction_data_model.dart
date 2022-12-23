import 'dart:convert';

import 'book_detail_model.dart';

TransactionDataModel transactionDataModelFromJson(String str) =>
    TransactionDataModel.fromJson(json.decode(str));

class TransactionDataModel {
  TransactionDataModel({
    required this.status,
    required this.data,
    required this.recomendationBooks,
  });

  final String status;
  final Data data;
  final List<RecomendationBook> recomendationBooks;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDataModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        recomendationBooks: List<RecomendationBook>.from(
            json["recomendation_books"]
                .map((x) => RecomendationBook.fromJson(x))),
      );
}

class Data {
  Data({
    required this.sessionId,
    required this.transactionId,
    required this.referenceId,
    required this.via,
    required this.channel,
    required this.paymentNo,
    required this.qrString,
    required this.paymentName,
    required this.subTotal,
    required this.total,
    required this.fee,
    required this.expired,
    required this.qrImage,
    required this.qrTemplate,
  });

  final String sessionId;
  final int transactionId;
  final String referenceId;
  final String via;
  final String channel;
  final String paymentNo;
  final String qrString;
  final String paymentName;
  final int subTotal;
  final int total;
  final int fee;
  final DateTime expired;
  final String qrImage;
  final String qrTemplate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sessionId: json["SessionId"],
        transactionId: json["TransactionId"],
        referenceId: json["ReferenceId"],
        via: json["Via"],
        channel: json["Channel"],
        paymentNo: json["PaymentNo"],
        qrString: json["QrString"],
        paymentName: json["PaymentName"],
        subTotal: json["SubTotal"],
        total: json["Total"],
        fee: json["Fee"],
        expired: DateTime.parse(json["Expired"]),
        qrImage: json["QrImage"],
        qrTemplate: json["QrTemplate"],
      );
}

class RecomendationBook {
  RecomendationBook({
    required this.id,
    required this.name,
    required this.writer,
    required this.thumbnail,
    required this.rating,
    required this.totalReview,
    required this.priceMax,
    required this.priceMin,
  });

  final String id;
  final String name;
  final String writer;
  final String thumbnail;
  final double rating;
  final int totalReview;
  final PriceM? priceMax;
  final PriceM? priceMin;

  factory RecomendationBook.fromJson(Map<String, dynamic> json) =>
      RecomendationBook(
        id: json["name"],
        name: json["id"],
        writer: json["writer"],
        thumbnail: json["thumbnail"],
        rating: json["rating"].toDouble(),
        totalReview: json["total_review"],
        priceMax: json["price_max"] != null
            ? PriceM.fromJson(jsonDecode(json["price_max"]))
            : null,
        priceMin: json["price_min"] != null
            ? PriceM.fromJson(jsonDecode(json["price_min"]))
            : null,
      );
}
