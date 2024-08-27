import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';

class AddressPincodeTextFiled extends StatelessWidget {
  const AddressPincodeTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final addressViewController = Get.put(AddressViewContoller());

    return Container(
      alignment: Alignment.center,
      height: 47,
      width: 340,
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "selectpincode".tr,
          hintStyle: TextStyle(color: AppColors.addressTextFieldHintColor),
          fillColor: AppColors.addressTextFieldColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.addressTextFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.splashScreenBackColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: AppColors.addressTextFieldColor),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        keyboardType: TextInputType.number,
        controller: addressViewController.pincodeTextFieldController.value,
      ),

      
      
    );
  }
}
