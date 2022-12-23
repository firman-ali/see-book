import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:see_book_app/app/constant/constant.dart';
import 'package:see_book_app/app/constant/custom_color_style.dart';
import 'package:see_book_app/app/constant/custom_text_style.dart';
import 'package:see_book_app/app/modules/checkout/controllers/checkout_controller.dart';

class PaymentView extends GetView<CheckoutController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: 500,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                cardRadius,
              ),
            ),
            child: GetBuilder(
              init: controller,
              builder: (_) => CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 24.0, bottom: 16.0),
                    sliver: paymentMethodCategory("E-Wallet"),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, bottom: 24.0),
                    sliver: SliverList(
                      delegate: paymentMethodList(
                        paymentMethodName: paymentMethodEWallet,
                        paymentFee: paymentMethodEwalletFee,
                        paymentMethodCount: paymentMethodEWallet.length,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, bottom: 16.0),
                    sliver: paymentMethodCategory("VA"),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    sliver: SliverList(
                      delegate: paymentMethodList(
                        paymentMethodName: paymentMethodVa,
                        paymentFee: paymentMethodVaFee,
                        paymentMethodCount: paymentMethodVa.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverChildBuilderDelegate paymentMethodList(
      {required List<String> paymentMethodName,
      required List<int> paymentFee,
      required int paymentMethodCount}) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return InkWell(
          onTap: () => controller.changeCurrentPaymentMethod(
            paymentMethodName[index],
            paymentFee[index],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                cardRadius,
              ),
            ),
            color: CustomColorStyle.primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentMethodName[index],
                    style: customTextStyle.bodyText1
                        ?.copyWith(color: CustomColorStyle.onPrimaryColor),
                  ),
                  Text(
                    "${paymentFee[index]}",
                    style: customTextStyle.bodyText1
                        ?.copyWith(color: CustomColorStyle.onPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      childCount: paymentMethodCount,
    );
  }

  SliverToBoxAdapter paymentMethodCategory(String paymentCategory) {
    return SliverToBoxAdapter(
      child: Text(
        paymentCategory,
        style: customTextStyle.headline6,
      ),
    );
  }
}
