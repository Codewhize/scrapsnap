import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileNumberContoller = Get.put(MobileNumberNameController());
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 50,
      width: 250.35,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please enter mobile number";
          }
          return null;
        },
        controller: mobileNumberContoller.mobileNumberController.value,
        keyboardType: TextInputType.phone,
        cursorColor: AppColors.mobileSignInSubtitleTextColor,
        decoration: InputDecoration(
          hintText: "entermobile".tr,
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
            borderSide: BorderSide(color: AppColors.splashScreenBackColor),
          ),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide:
                BorderSide(color: AppColors.errorBorderColor, width: 1.2),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ],
      ),
    );
  }
}
