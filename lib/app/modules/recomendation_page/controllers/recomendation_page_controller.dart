import 'package:get/get.dart';
import 'package:see_book_app/app/model/transaction_data_model.dart';

class RecomendationPageController extends GetxController {
  late TransactionDataModel transactionData;
  @override
  void onInit() {
    transactionData = Get.arguments;
    print(transactionData.data.fee);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
