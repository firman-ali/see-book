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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        controller: controller.emailTextEditingController,
                        validator: (value) => controller.emailValidator(value),
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
                              CustomColorStyle.primaryColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        controller: controller.passwordTextEditingController,
                        validator: (value) =>
                            controller.passwordValidator(value),
                        obscureText: controller.isPasswordObscureOn == true
                            ? true
                            : false,
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: customTextStyle.bodyText1?.copyWith(
                                color: CustomColorStyle.primaryColor),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changePasswordObscureStatus(),
                            icon: controller.isPasswordObscureOn == true
                                ? const Icon(
                                    Icons.visibility_off,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                  ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        obscureText:
                            controller.isReTypePasswordObscureOn == true
                                ? true
                                : false,
                        validator: (value) =>
                            controller.reTypePasswordValidator(value),
                        decoration: InputDecoration(
                          label: Text(
                            "Re-Type Password",
                            style: customTextStyle.bodyText1?.copyWith(
                                color: CustomColorStyle.primaryColor),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changeReTypePasswordObscureStatus(),
                            icon: controller.isReTypePasswordObscureOn == true
                                ? const Icon(
                                    Icons.visibility_off,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                  ),
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
                    ),
                    ElevatedButton(
                      onPressed: () => controller.formValidator(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          CustomColorStyle.primaryColor,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                            CustomColorStyle.onPrimaryColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Register",
                          style: customTextStyle.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: customTextStyle.bodyText1,
                ),
                TextButton(
                  onPressed: () => Get.offNamed(Routes.LOGIN),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      CustomColorStyle.secondaryColor,
                    ),
                  ),
                  child: Text(
                    "Login now.",
                    style: customTextStyle.bodyText1,
                  ),
                )
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
