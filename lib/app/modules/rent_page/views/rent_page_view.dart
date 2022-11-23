import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rent_page_controller.dart';

class RentPageView extends GetView<RentPageController> {
  const RentPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RentPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RentPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
