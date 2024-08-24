import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';

class EnterNameTextField extends StatelessWidget {
  const EnterNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = Get.put(MobileNumberNameController());
    return Container(
      margin: const EdgeInsets.only(top: 22),
      height: 52,
      width: 335,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
        controller: nameController.nameController.value,
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
          // errorText: "Please",
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide:
                BorderSide(color: AppColors.errorBorderColor, width: 1.3),
          ),
        ),
      ),
    );
  }
}
