import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:see_book_app/app/constant/api.dart';
import 'package:see_book_app/app/model/book_model.dart';

class HomeService {
  getBookData() async {
    try {
      final response = await http.get(Uri.parse(Api.getBookPath));
      if (response.statusCode == 200) {
        return BookModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load book data');
      }
    } catch (e) {
      print(e);
    }
  }
}
