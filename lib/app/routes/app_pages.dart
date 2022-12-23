import 'package:get/get.dart';

import '../modules/book_detail/bindings/book_detail_binding.dart';
import '../modules/book_detail/views/book_detail_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/recomendation_page/bindings/recomendation_page_binding.dart';
import '../modules/recomendation_page/views/recomendation_page_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/rent_page/bindings/rent_page_binding.dart';
import '../modules/rent_page/views/rent_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAIL,
      page: () => const BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.RENT_PAGE,
      page: () => const RentPageView(),
      binding: RentPageBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.RECOMENDATION_PAGE,
      page: () => const RecomendationPageView(),
      binding: RecomendationPageBinding(),
    ),
  ];
}
