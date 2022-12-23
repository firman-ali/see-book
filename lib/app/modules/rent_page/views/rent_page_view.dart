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
          child: GetBuilder(
            init: controller,
            builder: (_) => controller.isLoading == true
                ? CircularProgressIndicator()
                : Column(
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
                        child:
                            Text("Book Rent", style: customTextStyle.headline5),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () =>
                                  Get.toNamed(Routes.CHECKOUT, arguments: {
                                "book_data": controller.bookDetailData,
                                "price_data": controller
                                    .bookPriceData.priceData.listPrice[index],
                              }),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    cardRadius,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      controller.bookPriceData.priceData
                                                  .listPrice[index].duration ==
                                              0
                                          ? Text(
                                              "Buy book",
                                              style: customTextStyle.bodyText1,
                                            )
                                          : Text(
                                              "${controller.bookPriceData.priceData.listPrice[index].duration} Days",
                                              style: customTextStyle.bodyText1,
                                            ),
                                      Text(
                                        "Rp. ${controller.bookPriceData.priceData.listPrice[index].price}",
                                        style: customTextStyle.bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: controller
                              .bookPriceData.priceData.listPrice.length,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
