import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              constantImageProfile,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "App Dev",
                          style: customTextStyle.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: TextField(
                      controller: controller.bookTextEditingController,
                      decoration: InputDecoration(
                        hintText: "Search Something ...",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 75.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: constantCategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      constantCategory[index],
                                      style: customTextStyle.bodyText1,
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverList(
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
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
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
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
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
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
