import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileNumberNameController extends GetxController {
  RxString conutryCode = "+91".obs;
  static String countryCOde = "+91";
  // final GlobalKey<FormState> formKeyMobileNumber = GlobalKey<FormState>();
  // final GlobalKey<FormState> formKeyName = GlobalKey<FormState>();
  final mobileNumberController = TextEditingController().obs;
  final nameController = TextEditingController().obs;

  // @override
  // void dispose() {
  //   formKeyMobileNumber.currentState?.reset();
  //   formKeyName.currentState?.reset();
  //   super.dispose();
  // }
}
