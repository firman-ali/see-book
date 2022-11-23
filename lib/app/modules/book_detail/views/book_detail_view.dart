import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
