import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/utils/utils.dart';

class MobileNumberNameController extends GetxController {
  RxString conutryCode = "+91".obs;
  static String countryCOde = "+91";
  static var randomOtp = ''.obs;

  final mobileNumberController = TextEditingController().obs;
  final nameController = TextEditingController().obs;

  void randomeOTP() {
    final Random random = Random();

    randomOtp.value =
        List.generate(4, (index) => random.nextInt(10).toString()).join();

    Utils.snackbar("OTP", randomOtp.value, duration: 5);
  }
}
