import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/modules/checkout/views/payment_view.dart';

class CheckoutController extends GetxController {
  String paymentMethod = paymentMethodEWallet[0];
  int paymentFee = paymentMethodEwalletFee[0];
  @override
  void onInit() {
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
    Get.dialog(PaymentView());
  }

  changeCurrentPaymentMethod(String paymentMethodName, int paymentMethodFee) {
    paymentMethod = paymentMethodName;
    paymentFee = paymentMethodFee;
    update();
    Get.back();
  }
}
