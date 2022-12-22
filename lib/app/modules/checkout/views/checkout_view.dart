import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/modules/common/custom_back_button.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 16.0),
            sliver: SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: 395,
                    color: CustomColorStyle.primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 24.0, right: 24.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              const Expanded(
                                child: CustomBackButton(),
                              ),
                              Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Checkout",
                                      style:
                                          customTextStyle.headline5?.copyWith(
                                        color: CustomColorStyle.onPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(imageradius),
                                  child: Image.network(
                                    constantImageProfile,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title",
                                    style: customTextStyle.headline6?.copyWith(
                                      color: CustomColorStyle.onPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Writer",
                                    style: customTextStyle.bodyText1?.copyWith(
                                      color: CustomColorStyle.onPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Rp 77.000",
                                    style: customTextStyle.bodyText1?.copyWith(
                                      color: CustomColorStyle.onPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.info,
                                color: CustomColorStyle.onPrimaryColor,
                              ),
                            ),
                            Text(
                              "You can read this book until: -",
                              style: customTextStyle.bodyText1?.copyWith(
                                color: CustomColorStyle.onPrimaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
                    child: Text(
                      "Discounts",
                      style: customTextStyle.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Promo Code",
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
                            CustomColorStyle.errorColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Method",
                                style: customTextStyle.bodyText1,
                              ),
                              Text(
                                "+ Rp 7.000",
                                style: customTextStyle.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Change"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColorStyle.primaryColor),
                      foregroundColor: MaterialStateProperty.all(
                          CustomColorStyle.onPrimaryColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            sliver: SliverToBoxAdapter(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardRadius)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price : "),
                      Text(
                        "Rp. 777.000",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 64.0, right: 64.0),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.RECOMENDATION_PAGE),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomColorStyle.primaryColor),
                  foregroundColor: MaterialStateProperty.all(
                      CustomColorStyle.onPrimaryColor),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Text("Beli"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder(Color outlineColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: outlineColor),
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}
