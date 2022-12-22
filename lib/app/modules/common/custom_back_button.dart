import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/custom_color_style.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.back(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          CustomColorStyle.surfaceColor,
        ),
        foregroundColor: MaterialStateProperty.all(
          CustomColorStyle.onSurfaceColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }
}
