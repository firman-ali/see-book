import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:see_book_app/app/model/book_detail_model.dart';
import 'package:see_book_app/app/modules/book_detail/service/book_detail_service.dart';

class BookDetailController extends GetxController {
  var bookId = Get.arguments["id"];
  late BookDetailModel bookDetailData;
  bool isLoading = true;

  @override
  void onInit() {
    fetchDetailBookData();
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

  fetchDetailBookData() async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();
    bookDetailData = await BookDetailService().getBookDetailData(bookId, token);
    isLoading = false;
    update();
  }
}
