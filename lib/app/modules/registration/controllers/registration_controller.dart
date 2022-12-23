import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  bool isPasswordObscureOn = true;
  bool isReTypePasswordObscureOn = true;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
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

  changePasswordObscureStatus() {
    isPasswordObscureOn = !isPasswordObscureOn;
    update();
  }

  changeReTypePasswordObscureStatus() {
    isReTypePasswordObscureOn = !isReTypePasswordObscureOn;
    update();
  }

  emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    } else if (GetUtils.isEmail(value) == false) {
      return "Email is invalid";
    } else {
      return null;
    }
  }

  passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    } else if (value.length < 7) {
      return "Password must contain at least 7 characters";
    } else {
      return null;
    }
  }

  reTypePasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    } else if (value != passwordTextEditingController.text) {
      return "Password didn't match";
    } else {
      return null;
    }
  }

  formValidator() {
    if (formKey.currentState!.validate()) {
      print("Register");
    }
  }
}
