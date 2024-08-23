import 'package:flutter/material.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 50,
      width: 250.35,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        cursorColor: AppColors.mobileSignInSubtitleTextColor,
        decoration: InputDecoration(
          hintText: "Enter Mobile Number",
          hintStyle: TextStyle(color: AppColors.mobilenumberFieldTextColor),
          contentPadding: const EdgeInsets.only(left: 15),
          fillColor: AppColors.mobilenumberFieldColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.mobilenumberFieldColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.mobilenumberFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.appBackgroundColor),
          ),
        ),
      ),
    );
  }
}
