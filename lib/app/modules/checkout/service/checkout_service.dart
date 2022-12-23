import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:see_book_app/app/constant/api.dart';
import 'package:see_book_app/app/model/transaction_model.dart';

import '../../../model/transaction_data_model.dart';

class CheckoutService {
  static addCheckout(TransactionModel data, String token) async {
    try {
      final response = await http.post(Uri.parse('${Api.baseUrl}/v1/sales'),
          headers: {'Authorization': 'Bearer $token'}, body: data.toJson());

      if (response.statusCode == 200) {
        return TransactionDataModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load transaction');
      }
    } catch (e) {
      print(e);
    }
  }
}
