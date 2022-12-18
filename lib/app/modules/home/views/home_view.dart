import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) => CustomScrollView(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
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
                                    style: customTextStyle.headline6?.copyWith(
                                        color: CustomColorStyle.onPrimaryColor),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: controller.bookTextEditingController,
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
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 150.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Image.network(
                                  constantImageProfile,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "A Long Book Title For Debugging",
                                      style: customTextStyle.headline5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: Text(
                                            "Author : Author Name",
                                            style: customTextStyle.bodyText1,
                                          ),
                                        ),
                                        Text(
                                          "Publisher : Publisher Name",
                                          style: customTextStyle.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: bookRatingInfo("4.5"),
                                      ),
                                      bookPriceInfo("77.000"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Explore",
                  style: customTextStyle.headline5,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: 8,
                      (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(
                            constantImageProfile,
                            height: 125,
                            width: 125,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Book Title",
                                    style: customTextStyle.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: IconButton(
                                      onPressed: () =>
                                          controller.changeFavoriteStatus(),
                                      icon: controller.isFavorite == false
                                          ? const Icon(Icons.favorite_outline,
                                              color: Colors.red)
                                          : const Icon(Icons.favorite,
                                              color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Author: Author Name",
                                  style: customTextStyle.bodyText2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Publisher: Publisher Name",
                                  style: customTextStyle.bodyText2,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rate,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "4.5/5",
                                          style: customTextStyle.bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.paid,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        "Rp. 777.000",
                                        style: customTextStyle.bodyText2,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
            )
          ],
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
