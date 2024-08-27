import 'package:get/get.dart';
import 'dart:ui';

class SelectLanguageController extends GetxController {
  RxString selectedLanguage = "English".obs;

  void changeLanguage(String language) {
    String langCode;
    switch (language) {
      case 'Gujarati':
        langCode = 'gu';
        break;
      case 'Hindi':
        langCode = 'hi';
        break;
      default:
        langCode = 'en';
        break;
    }
    Get.updateLocale(Locale(langCode));
    // selectedLanguage.value = language;
  }
}
