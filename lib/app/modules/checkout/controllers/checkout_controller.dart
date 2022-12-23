import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/model/book_detail_model.dart';
import 'package:see_book_app/app/model/book_price_model.dart';
import 'package:see_book_app/app/model/transaction_model.dart';
import 'package:see_book_app/app/modules/checkout/service/checkout_service.dart';
import 'package:see_book_app/app/modules/checkout/views/payment_view.dart';

import '../../../model/transaction_data_model.dart';
import '../../../routes/app_pages.dart';

class CheckoutController extends GetxController {
  String paymentMethod = paymentMethodEWallet[0];
  int paymentFee = paymentMethodEwalletFee[0];
  late BookDetailModel bookData;
  late PriceM bookRentData;
  @override
  void onInit() {
    bookData = Get.arguments["book_data"];
    bookRentData = Get.arguments["price_data"];
    print(bookData.bookDetailData.name);
    print(bookRentData.price);
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

  changePaymentMethod() {
    Get.dialog(const PaymentView());
  }

  changeCurrentPaymentMethod(String paymentMethodName, int paymentMethodFee) {
    paymentMethod = paymentMethodName;
    paymentFee = paymentMethodFee;
    Get.back();
    update();
  }

  checkout() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
    final data = TransactionModel(
        customerName: 'test',
        customerPhoneNumber: "08123456789",
        book: "B-207",
        priceType: "permanent",
        duration: 0,
        subTotal: 5000,
        voucher: 0,
        total: 5000,
        paymentMethod: "qris",
        paymentChannel: "qris");
    TransactionDataModel? response =
        await CheckoutService.addCheckout(data, token);
    Get.offAllNamed(Routes.RECOMENDATION_PAGE, arguments: response);
  }
}
