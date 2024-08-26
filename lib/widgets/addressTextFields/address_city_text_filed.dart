import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';

class AddressCityTextFiled extends StatelessWidget {
  const AddressCityTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final addressViewController = Get.put(AddressViewContoller());

    return Container(
      alignment: Alignment.center,
      height: 47,
      width: 340,
      margin: const EdgeInsets.only(top: 37),
      child: Obx(
        () => TextFormField(
          controller: addressViewController.cityTextFieldController.value,
          decoration: InputDecoration(
            hintText: "Enter or Select City",
            hintStyle: TextStyle(color: AppColors.addressTextFieldHintColor),
            suffixIcon: DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                items: addressViewController.cityList.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: addressViewController.onCityChanged),
            fillColor: AppColors.addressTextFieldColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide(color: AppColors.addressTextFieldColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide(color: AppColors.addressTextFieldColor),
            ),
          ),
        ),
      ),
    );
  }
}
