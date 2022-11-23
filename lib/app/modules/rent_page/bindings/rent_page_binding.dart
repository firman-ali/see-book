import 'package:get/get.dart';

import '../controllers/rent_page_controller.dart';

class RentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentPageController>(
      () => RentPageController(),
    );
  }
}
