import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/appColors/app_colors.dart';
import '../../view_model/controller/addressViewController/address_view_contoller.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final addressViewController = Get.put(AddressViewContoller());

    return Container(
      alignment: Alignment.center,
      height: 118,
      width: 340,
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "address_hint".tr,
          hintStyle: TextStyle(color: AppColors.addressTextFieldHintColor),
          fillColor: AppColors.addressTextFieldColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.addressTextFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.splashScreenBackColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.addressTextFieldColor),
          ),
        ),
        controller: addressViewController.addressTextFieldController.value,
      ),
    );
  }
}
