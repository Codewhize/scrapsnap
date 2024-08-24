import 'dart:async';

import 'package:get/get.dart';

class Utils {
  static void getNavigate(int duration, String routesName) {
    Timer(
      Duration(seconds: duration),
      () {
        Get.toNamed(routesName);
      },
    );
  }

  static void snackbar(String title, String message) {
    Get.snackbar(title, message, duration: const Duration(seconds: 3));
  }
}
