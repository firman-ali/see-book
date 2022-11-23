import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isFavorite = false;
  late TextEditingController bookTextEditingController;

  @override
  void onInit() {
    bookTextEditingController = TextEditingController();
    super.onInit();
  }

  changeFavoriteStatus() {
    isFavorite = !isFavorite;
    update();
  }
}
