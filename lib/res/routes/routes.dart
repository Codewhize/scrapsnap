import 'package:get/get.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/view/mobileNumberSignInView/mobile_number_signin_view.dart';
import 'package:scrapsnap/view/mobileNumberSignInView/otp_view.dart';
import 'package:scrapsnap/view/onBoadingView/onBoading_view.dart';
import 'package:scrapsnap/view/selectLanguageView/select_language_view.dart';
import 'package:scrapsnap/view/splashView/splash_view.dart';
import 'package:scrapsnap/view/temp.dart';

import '../../view/addressView/address_view.dart';

class Routes {
  static List<GetPage> appRoutes = [
    GetPage(
      name: RoutesName.splashView,
      page: () => const SplashView(),
    ),
    GetPage(
      name: RoutesName.onBoadingView,
      page: () => const OnBoadingView(),
    ),
    GetPage(
      name: RoutesName.selectLanguageView,
      page: () => const SelectLanguageView(),
    ),
    GetPage(
      name: RoutesName.mobileSignInView,
      page: () => const MobileNumberSigninView(),
    ),
    GetPage(
      name: RoutesName.otpView,
      page: () => const OtpView(),
    ),
    GetPage(
      name: RoutesName.addressView,
      page: () => const AddressView(),
    ),
    GetPage(
      name: RoutesName.temp,
      page: () => AddressTypeSelector(),
    ),
  ];
}
