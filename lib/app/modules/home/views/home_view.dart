import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) => controller.isLoading == true
            ? const CircularProgressIndicator()
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    sliver: SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Container(
                            color: CustomColorStyle.primaryColor,
                            height: 200,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: Image.network(
                                              constantImageProfile,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Hello, App Dev!",
                                          style: customTextStyle.headline6
                                              ?.copyWith(
                                                  color: CustomColorStyle
                                                      .onPrimaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextField(
                                    controller:
                                        controller.bookTextEditingController,
                                    decoration: InputDecoration(
                                      hintText: "Search Something ...",
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: CustomColorStyle.surfaceColor,
                                      enabledBorder: customOutlineInputBorder(
                                          CustomColorStyle.surfaceColor),
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
                  bookSectionHeader("New Book"),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: bookList(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    sliver: exploreHeader(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: exploreSliverList(),
                  )
                ],
              ),
      ),
    );
  }

  SliverToBoxAdapter bookList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 450,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cardRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(imageradius),
                          child: Image.network(
                            constantImageProfile,
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "A Long Book Title For Debugging",
                                style: customTextStyle.headline5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      "Author Name",
                                      style: customTextStyle.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: bookRatingInfo("4.5"),
                                ),
                                bookPriceInfo("77.000"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverList exploreSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.bookData.bookData.length,
        (BuildContext context, int index) {
          return InkWell(
            onTap: () => Get.toNamed(
              Routes.BOOK_DETAIL,
              arguments: {"id": controller.bookData.bookData[index].id},
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cardRadius)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(imageradius),
                      child: Image.network(
                        controller.bookData.bookData[index].thumbnail,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            controller.bookData.bookData[index].name,
                            style: customTextStyle.headline5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            controller.bookData.bookData[index].writer,
                            style: customTextStyle.bodyText1,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.star_rate,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  controller.bookData.bookData[index].rating <=
                                          0
                                      ? Text(
                                          "-",
                                          style: customTextStyle.bodyText1,
                                        )
                                      : Text(
                                          "${controller.bookData.bookData[index].rating} / 5",
                                          style: customTextStyle.bodyText1,
                                        ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.paid,
                                    color: Colors.green,
                                  ),
                                ),
                                controller.bookData.bookData[index].priceMin ==
                                            null ||
                                        controller.bookData.bookData[index]
                                                .priceMax ==
                                            null
                                    ? Text(
                                        "Rp. -",
                                        style: customTextStyle.bodyText2,
                                      )
                                    : Text(
                                        "Rp. ${controller.bookData.bookData[index].priceMin["price"]} - Rp. ${controller.bookData.bookData[index].priceMax["price"]}",
                                        style: customTextStyle.bodyText2,
                                      ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SliverPadding exploreHeader() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Explore",
          style: customTextStyle.headline5,
        ),
      ),
    );
  }

  Row bookPriceInfo(String price) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.payments,
            color: Colors.green,
          ),
        ),
        Text(
          "Rp $price",
          style: customTextStyle.bodyText1,
        ),
      ],
    );
  }

  Row bookRatingInfo(String rating) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.star,
            color: Colors.orange,
          ),
        ),
        Text(
          "$rating / 5",
          style: customTextStyle.bodyText1,
        ),
      ],
    );
  }

  SliverPadding bookSectionHeader(String sectionTitle) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionTitle,
              style: customTextStyle.headline5,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  CustomColorStyle.primaryColor,
                ),
              ),
              child: Text(
                "View More >",
                style: customTextStyle.bodyText1,
              ),
            ),
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
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}
