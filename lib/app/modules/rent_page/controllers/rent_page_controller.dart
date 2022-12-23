import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:see_book_app/app/model/book_detail_model.dart';
import 'package:see_book_app/app/model/book_price_model.dart';
import 'package:see_book_app/app/modules/rent_page/service/rent_page_service.dart';

class RentPageController extends GetxController {
  late BookDetailModel bookDetailData;
  late BookPriceModel bookPriceData;
  bool isLoading = true;

  @override
  void onInit() {
    bookDetailData = Get.arguments;
    fetchPriceData();
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

  fetchPriceData() async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    var bookId = bookDetailData.bookDetailData.id;
    bookPriceData = await RentPageService().getBookPriceData(bookId, token);
    isLoading = false;
    update();
  }
}
