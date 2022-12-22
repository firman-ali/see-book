import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:see_book_app/app/model/book_model.dart';
import 'package:see_book_app/app/modules/home/service/home_service.dart';

class HomeController extends GetxController {
  bool isFavorite = false;
  late TextEditingController bookTextEditingController;
  bool isLoading = true;
  late BookModel bookData;

  @override
  void onInit() {
    bookTextEditingController = TextEditingController();
    fetchBookData();
    super.onInit();
  }

  changeFavoriteStatus() {
    isFavorite = !isFavorite;
    update();
  }

  fetchBookData() async {
    bookData = await HomeService().getBookData();
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    print(token);
    isLoading = false;
    update();
    print(bookData.bookData[0].name);
  }
}
