import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/modules/common/custom_back_button.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../controllers/recomendation_page_controller.dart';

class RecomendationPageView extends GetView<RecomendationPageController> {
  const RecomendationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24.0),
          sliver: SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 300,
                  color: CustomColorStyle.primaryColor,
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.done,
                              size: 64.0,
                              color: CustomColorStyle.onPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Transaction success",
                              style: customTextStyle.headline5?.copyWith(
                                  color: CustomColorStyle.onPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.offAllNamed(Routes.HOME),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CustomColorStyle.secondaryColor,
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                  CustomColorStyle.onSecondaryColor),
                              shape: MaterialStateProperty.all(
                                const StadiumBorder(),
                              ),
                            ),
                            child: Text("Back to home"),
                          )
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
          padding: const EdgeInsets.only(left: 32.0, bottom: 16.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Our Recomendation",
              style: customTextStyle.headline5,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(
                      Routes.BOOK_DETAIL,
                      arguments: {
                        "id": controller
                            .transactionData.recomendationBooks[index].id,
                      },
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(cardRadius)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(imageradius),
                                child: Image.network(
                                  controller.transactionData
                                      .recomendationBooks[index].thumbnail,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      controller.transactionData
                                          .recomendationBooks[index].name,
                                      style: customTextStyle.headline5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      controller.transactionData
                                          .recomendationBooks[index].writer,
                                      style: customTextStyle.bodyText1,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            Text(
                                              "${controller.transactionData.recomendationBooks[index].rating} / 5",
                                              style: customTextStyle.bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.paid,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Text(
                                            "Rp. -",
                                            style: customTextStyle.bodyText1,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: controller.transactionData.recomendationBooks.length,
            ),
          ),
        )
      ],
    ));
  }
}
