import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';

class EnterNameTextField extends StatelessWidget {
  const EnterNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 6, 19, 6),
      child: Container(
        margin: const EdgeInsets.only(top: 19),
        height: 50,
        width: 335,
        child: TextFormField(
          style: TextStyle(color: AppColors.namefieldHintColor),
          cursorColor: AppColors.mobileSignInSubtitleTextColor,
          decoration: InputDecoration(
            hintText: "entername".tr,
            hintStyle: TextStyle(
                color: AppColors.namefieldHintColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.only(left: 15),
            filled: true,
            fillColor: AppColors.nameFieldColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide(color: AppColors.nameFieldColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide(color: AppColors.nameFieldColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide:
                  BorderSide(color: AppColors.mobileSignInTitleTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
