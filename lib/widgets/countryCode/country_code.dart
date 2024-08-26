import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileNumberController = Get.put(MobileNumberNameController());
    return Container(
      width: 74.27,
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.elevatedButtonBackgroundColor,
        borderRadius: BorderRadius.circular(500),
      ),
      child: CountryCodePicker(
        onChanged: (value) {
          mobileNumberController.conutryCode.value = value.toString();
        },
        showCountryOnly: false,
        favorite: const ["+91 India"],
        showDropDownButton: true,
        showOnlyCountryWhenClosed: true,
        showFlag: false,
        textStyle: TextStyle(
          color: AppColors.elevatedButtonTextColor,
          fontSize: 16.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        builder: (countryCode) {
          return Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mobileNumberController.conutryCode.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_outlined,
                    color: AppColors.elevatedButtonTextColor)
              ],
            ),
          );
        },
      ),
    );
  }
}
