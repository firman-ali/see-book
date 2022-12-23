import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:see_book_app/app/modules/login/service/login_service.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  bool isPasswordIsObescured = true;

  @override
  void onInit() {
    FirebaseAuth.instance.signOut();
    formKey = GlobalKey<FormState>();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.onInit();
  }

  changePasswordObscureStatus() {
    isPasswordIsObescured = !isPasswordIsObescured;
    update();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    } else if (GetUtils.isEmail(value) == false) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    } else if (value.length < 7) {
      return "Password must contain at least 7 characters";
    } else {
      return null;
    }
  }

  formValidator() async {
    if (formKey.currentState?.validate() == true) {
      try {
        await LoginService().login(emailTextEditingController.text,
            passwordTextEditingController.text);
        Get.offNamed(Routes.HOME);
      } catch (e) {
        print(e);
      }
    }
  }
}
