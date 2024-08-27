import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';

class AddressAreaTextFiled extends StatelessWidget {
  const AddressAreaTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final addressViewController = Get.put(AddressViewContoller());

    return Container(
      alignment: Alignment.center,
      height: 47,
      width: 340,
      margin: const EdgeInsets.only(top: 20),
      child: Obx(
        () => TextFormField(
          controller: addressViewController.areaTextFieldController.value,
          decoration: InputDecoration(
            hintText: "selectarea".tr,
            hintStyle: TextStyle(color: AppColors.addressTextFieldHintColor),
            suffixIcon: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 27,
                  color: AppColors.dropdownButtonColor,
                ),
                items: addressViewController.areaList.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: addressViewController.onChangeArea,
              ),
            ),
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
