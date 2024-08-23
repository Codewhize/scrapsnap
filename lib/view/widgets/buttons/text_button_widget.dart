import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double fontSize;
  final double width;
  final double height;
  final Color color;
  final double topMargin;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPress,
    this.fontSize = 18,
    this.width = 60,
    this.height = 50,
    this.color = Colors.black,
    this.topMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, color: color, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
