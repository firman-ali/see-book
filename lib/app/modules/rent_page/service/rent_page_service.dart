import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:see_book_app/app/constant/api.dart';
import 'package:see_book_app/app/model/book_price_model.dart';

class RentPageService {
  getBookPriceData(String id, String token) async {
    final response = await http.get(Uri.parse("${Api.getBookPricePath}/$id"),
        headers: <String, String>{
          "Authorization": "Bearer $token",
        });

    print(response.body);

    if (response.statusCode == 200) {
      return BookPriceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
