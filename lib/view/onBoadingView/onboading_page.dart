import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/onboading_controller.dart';

class OnboadingPage extends StatelessWidget {
  final String image;
  final String text;
  final String subtitle;
  final int pageCount;
  const OnboadingPage(
      {super.key,
      required this.image,
      required this.text,
      required this.subtitle,
      this.pageCount = 0});

  @override
  Widget build(BuildContext context) {
    final onBoadingController = Get.put(OnboadingController());

    return Container(
      margin: EdgeInsets.only(
          top: onBoadingController.changeTitleTopMargin(pageCount)),
      child: Column(
        children: [
          SvgPicture.asset(image),
          const SizedBox(
            height: 69.35,
          ),
          Text(
            text.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.onBoadingTitleTextColor),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            subtitle.tr,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.onBoadingSubtitleTextColor),
          ),
        ],
      ),
    );
  }
}
