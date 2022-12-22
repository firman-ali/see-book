import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColorStyle.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  "See Book",
                  style: customTextStyle.headline5
                      ?.copyWith(color: CustomColorStyle.onSurfaceColor),
                ),
              ),
              GetBuilder(
                init: controller,
                builder: (_) => Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          controller: controller.emailTextEditingController,
                          validator: (value) =>
                              controller.emailValidator(value),
                          decoration: InputDecoration(
                            label: Text(
                              "Email",
                              style: customTextStyle.bodyText1?.copyWith(
                                  color: CustomColorStyle.primaryColor),
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
                                CustomColorStyle.errorColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          controller: controller.passwordTextEditingController,
                          obscureText: controller.isPasswordIsObescured == true
                              ? true
                              : false,
                          validator: (value) =>
                              controller.passwordValidator(value),
                          decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style: customTextStyle.bodyText1?.copyWith(
                                  color: CustomColorStyle.primaryColor),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  controller.changePasswordObscureStatus(),
                              icon: controller.isPasswordIsObescured == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
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
                                CustomColorStyle.errorColor),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.formValidator(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Login",
                            style: customTextStyle.bodyText1,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            CustomColorStyle.primaryColor,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            CustomColorStyle.onPrimaryColor,
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
