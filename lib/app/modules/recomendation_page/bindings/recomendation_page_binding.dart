import 'package:get/get.dart';

import '../controllers/recomendation_page_controller.dart';

class RecomendationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecomendationPageController>(
      () => RecomendationPageController(),
    );
  }
}
