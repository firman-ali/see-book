import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../controllers/rent_page_controller.dart';

class RentPageView extends GetView<RentPageController> {
  const RentPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColorStyle.surfaceColor),
                        foregroundColor: MaterialStateProperty.all(
                            CustomColorStyle.onSurfaceColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text("Book Rent", style: customTextStyle.headline5),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.CHECKOUT),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardRadius)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "7 Hari",
                          style: customTextStyle.bodyText1,
                        ),
                        Text(
                          "Rp. 77.000",
                          style: customTextStyle.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
