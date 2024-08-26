import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/utils/utils.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';

class OtpController extends GetxController {
  final mobileController = Get.put(MobileNumberNameController);
  final otpTextController = TextEditingController().obs;

  static String markMobileNumber(String mobileNumber) {
    // mobileNumber = '1234567890';
    String firstPart = '';
    String lastPart = '';
    if (mobileNumber.length != 10) {
      Utils.snackbar("error", "Please enter valid Mobile Number!");
    } else {
      firstPart = mobileNumber.substring(0, 3);
      lastPart = mobileNumber.substring(6, 10);
    }
    return "$firstPart****$lastPart";
  }

  PinTheme defaulTheme() {
    return PinTheme(
      width: 44.81,
      height: 44.81,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          border: Border.all(color: AppColors.appBackgroundColor),
          color: AppColors.appBackgroundColor),
    );
  }

  void otpValidation() {
    String mobileNumber = MobileNumberNameController.randomOtp.toString();
    String otp = otpTextController.value.text;
    if (mobileNumber == otp) {
      Utils.snackbar("success", "OTP is valid");
    } else {
      Utils.snackbar("Error", "Please enter valid OTP");
    }
  }
}
