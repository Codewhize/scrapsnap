import 'package:flutter/material.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';

class ElevatButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final int currentPage;
  final double bottomMargin;
  const ElevatButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.currentPage = 0,
      this.width = 98,
      this.height = 43,
      this.bottomMargin = 10});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(500),
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.elevatedButtonBackgroundColor,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: currentPage == 3 ? 30 : 18,
              fontWeight: FontWeight.w500,
              color: AppColors.elevatedButtonTextColor),
        ),
      ),
    );
  }
}
