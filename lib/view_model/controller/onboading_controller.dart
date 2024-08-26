import 'package:get/get.dart';

class OnboadingController extends GetxController {
  int pageCount = 0;
  RxDouble containerTopMargin = 169.0.obs;
  RxDouble titleTopMargin = 169.0.obs;
  RxInt currentPage = 0.obs;

  void changeContainerTopMargin(int pageCount) {
    switch (pageCount) {
      case 0:
        containerTopMargin.value = 169.0;
        break;
      case 1:
        containerTopMargin.value = 213.0;
        break;
      case 2:
        containerTopMargin.value = 193.0;
        break;
      case 3:
        containerTopMargin.value = 169.0;
        break;
      default:
        containerTopMargin.value = 169.0;
        break;
    }
  }

  double changeTitleTopMargin(int pageCount) {
    switch (pageCount) {
      case 0:
        titleTopMargin.value = 69.35;

        break;
      case 1:
        titleTopMargin.value = 69.45;
        break;
      case 2:
        titleTopMargin.value = 68.45;
        break;
      case 3:
        titleTopMargin.value = 38.83;
        break;
      default:
        titleTopMargin.value = 69.35;
        break;
    }
    return titleTopMargin.value;
  }
}
