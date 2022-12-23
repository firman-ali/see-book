import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../../common/custom_back_button.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) => controller.isLoading == true
            ? const CircularProgressIndicator()
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Container(
                          height: 450,
                          color: CustomColorStyle.primaryColor,
                        ),
                        SizedBox(
                          height: 450,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 24.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      CustomBackButton(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(imageradius),
                                        child: Image.network(
                                          controller.bookDetailData
                                              .bookDetailData.thumbnail,
                                          height: 175,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    controller
                                        .bookDetailData.bookDetailData.name,
                                    style: customTextStyle.headline5?.copyWith(
                                      color: CustomColorStyle.onPrimaryColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    controller
                                        .bookDetailData.bookDetailData.writer,
                                    style: customTextStyle.bodyText1?.copyWith(
                                      color: CustomColorStyle.onPrimaryColor,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    controller.bookDetailData.bookDetailData
                                                .rating <=
                                            0
                                        ? Text(
                                            "-",
                                            style: customTextStyle.bodyText1
                                                ?.copyWith(
                                                    color: CustomColorStyle
                                                        .onPrimaryColor),
                                          )
                                        : Text(
                                            "${controller.bookDetailData.bookDetailData.rating}/5",
                                            style: customTextStyle.bodyText1
                                                ?.copyWith(
                                              color: CustomColorStyle
                                                  .onPrimaryColor,
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
                    sliver: SliverToBoxAdapter(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Publisher",
                                style: customTextStyle.headline6,
                              ),
                              Text(
                                controller
                                    .bookDetailData.bookDetailData.publisher,
                                style: customTextStyle.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    sliver: SliverToBoxAdapter(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: customTextStyle.headline6,
                              ),
                              controller.bookDetailData.bookDetailData
                                              .priceMin ==
                                          null ||
                                      controller.bookDetailData.bookDetailData
                                              .priceMax ==
                                          null
                                  ? Text(
                                      "Rp -",
                                      style: customTextStyle.bodyText1,
                                    )
                                  : Text(
                                      "Rp. ${controller.bookDetailData.bookDetailData.priceMin!.price} - Rp. ${controller.bookDetailData.bookDetailData.priceMax!.price}",
                                      style: customTextStyle.bodyText1,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    sliver: SliverToBoxAdapter(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  "Description",
                                  style: customTextStyle.headline6,
                                ),
                              ),
                              Text(
                                controller
                                    .bookDetailData.bookDetailData.synopsis,
                                style: customTextStyle.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    sliver: SliverToBoxAdapter(
                      child:
                          Text("7 Review(s)", style: customTextStyle.headline6),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 100),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300),
                                            child: Image.network(
                                              constantImageProfile,
                                              height: 45,
                                              width: 45,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Reviewer",
                                                style:
                                                    customTextStyle.subtitle1,
                                              ),
                                              Text(
                                                "18/12/2022",
                                                style: customTextStyle.bodyText1
                                                    ?.copyWith(
                                                  color: CustomColorStyle
                                                      .onSurfaceColor
                                                      .withOpacity(0.35),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star_outline),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: SizedBox(
                                          width: 45,
                                        ),
                                      ),
                                      Text(
                                        "This book is really amazing, I love it!",
                                        style: customTextStyle.bodyText1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: 7,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      bottomSheet: Container(
        height: 100,
        color: CustomColorStyle.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.RENT_PAGE,
                        arguments: controller.bookDetailData),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColorStyle.primaryColor),
                      foregroundColor: MaterialStateProperty.all(
                          CustomColorStyle.onPrimaryColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Rent", style: customTextStyle.bodyText1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.CHECKOUT, arguments: {
                      "book_data": controller.bookDetailData,
                      "price_data":
                          controller.bookDetailData.bookDetailData.priceMax
                    }),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          CustomColorStyle.primaryColor),
                      foregroundColor: MaterialStateProperty.all(
                          CustomColorStyle.onPrimaryColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Buy",
                        style: customTextStyle.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
