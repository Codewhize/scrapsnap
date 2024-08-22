import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/view/widgets/buttons/elevat_button_widget.dart';

class ShowBottomSheet extends StatelessWidget {
  final RxString selectedLanguage = 'English'.obs;

  ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = ['English', 'Gujarat', 'Hindi'];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Language',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 43),
          Column(
            children: languages.map((language) {
              return Obx(() {
                final bool isSelected = selectedLanguage.value == language;
                return RadioListTile<String>(
                  title: Text(
                    language,
                    style: TextStyle(
                        color: isSelected
                            ? AppColors.selectLanguageTextColor
                            : AppColors.notSelectLanguageTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  value: language,
                  groupValue: selectedLanguage.value,
                  onChanged: (value) {
                    selectedLanguage.value = value!;
                  },
                  activeColor: AppColors.selectLanguageTextColor,
                );
              });
            }).toList(),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatButtonWidget(
            text: "Continue",
            onPressed: () {
              Get.toNamed(RoutesName.mobileSignInView);
            },
            width: 134,
            height: 43,
            bottomMargin: 62,
          )
        ],
      ),
    );
  }
}
