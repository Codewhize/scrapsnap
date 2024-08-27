import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';
import 'package:flutter/material.dart';

class AddressStateTextField extends StatefulWidget {
  const AddressStateTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressStateTextFieldState createState() => _AddressStateTextFieldState();
}

class _AddressStateTextFieldState extends State<AddressStateTextField> {
  final addressViewController = Get.put(AddressViewContoller());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 47,
      width: 340,
      margin: const EdgeInsets.only(top: 37),
      child: Obx(
        () => TextFormField(
          controller: addressViewController.stateTextFieldController.value,
          decoration: InputDecoration(
            hintText: "selectstate".tr,
            hintStyle: TextStyle(color: AppColors.addressTextFieldHintColor),
            suffixIcon: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 27,
                    color: AppColors.dropdownButtonColor,
                  ),
                  items: addressViewController.stateList.map((String state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: addressViewController.onChangedState),
            ),
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
        ),
      ),
    );
  }
}
