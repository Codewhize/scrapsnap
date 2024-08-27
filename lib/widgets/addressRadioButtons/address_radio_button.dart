import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/appColors/app_colors.dart';
import '../../view_model/controller/addressViewController/address_view_contoller.dart';

class AddressRadioButton extends StatefulWidget {
  const AddressRadioButton({super.key});

  @override
  _AddressRadioButtonState createState() => _AddressRadioButtonState();
}

class _AddressRadioButtonState extends State<AddressRadioButton> {
  RxString selectedCategory = 'Home'.obs;

  // List of address types
  final List<String> addressTypes = ['Home', 'Office', 'Shop', 'Mall/Outlet'];
  final addressViewController = Get.put(AddressViewContoller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          ...addressTypes.asMap().entries.map((entry) {
            int index = entry.key;

            if (index % 2 == 0) {
              final bool isSelected =
                  selectedCategory.value == addressTypes[index];

              return Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      activeColor: AppColors.selectLanguageTextColor,
                      title: Text(
                        addressTypes[index],
                        style: TextStyle(
                            color: isSelected
                                ? AppColors.selectLanguageTextColor
                                : AppColors.notSelectLanguageTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      value: addressTypes[index],
                      groupValue: selectedCategory.value,
                      onChanged: (value) {
                        selectedCategory.value = value.toString();
                      },
                    ),
                  ),
                  Expanded(
                    child: index + 1 < addressTypes.length
                        ? RadioListTile(
                            activeColor: AppColors.selectLanguageTextColor,
                            title: Text(
                              addressTypes[index + 1],
                              style: TextStyle(
                                  color: selectedCategory.value ==
                                          addressTypes[index + 1]
                                      ? AppColors.selectLanguageTextColor
                                      : AppColors.notSelectLanguageTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            value: addressTypes[index + 1],
                            groupValue: selectedCategory.value,
                            onChanged: (value) {
                              selectedCategory.value = value.toString();
                            },
                          )
                        : Container(),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
