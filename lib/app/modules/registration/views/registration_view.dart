import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                "Registration",
                style: customTextStyle.headline5,
              ),
            ),
            GetBuilder(
              init: controller,
              builder: (_) => Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailTextEditingController,
                      validator: (value) => controller.emailValidator(value),
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: customTextStyle.bodyText1,
                        ),
                        filled: true,
                        fillColor: CustomColorStyle.surfaceColor,
                        enabledBorder: customOutlineInputBorder(
                            CustomColorStyle.surfaceColor),
                        focusedBorder: customOutlineInputBorder(
                            CustomColorStyle.primaryColor),
                        errorBorder: customOutlineInputBorder(
                            CustomColorStyle.errorColor),
                        focusedErrorBorder: customOutlineInputBorder(
                            CustomColorStyle.primaryColor),
                      ),
                    ),
                    TextFormField(
                      controller: controller.passwordTextEditingController,
                      validator: (value) => controller.passwordValidator(value),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.formValidator(),
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () => Get.offNamed(Routes.LOGIN),
                    child: Text("Login now."))
              ],
            )
          ],
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder(Color outlineColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: outlineColor,
      ),
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}
