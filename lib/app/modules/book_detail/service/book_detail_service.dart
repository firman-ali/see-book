import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:see_book_app/app/constant/api.dart';
import 'package:see_book_app/app/model/book_detail_model.dart';

class BookDetailService {
  getBookDetailData(bookId, token) async {
    var response = await http.get(
      Uri.parse("${Api.getBookPath}/$bookId"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return BookDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}