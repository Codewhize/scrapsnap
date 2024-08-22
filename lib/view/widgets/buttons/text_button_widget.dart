import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double fontSize;

  const TextButtonWidget(
      {super.key,
      required this.text,
      required this.onPress,
      this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 50,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              color: AppColors.textButtonTextColor,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
