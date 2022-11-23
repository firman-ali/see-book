import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgetPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
