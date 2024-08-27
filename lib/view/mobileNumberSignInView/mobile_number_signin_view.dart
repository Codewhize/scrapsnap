import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';
import 'package:scrapsnap/view_model/controller/otpController/otp_view_controller.dart';
import 'package:scrapsnap/widgets/buttons/elevat_button_widget.dart';
import 'package:scrapsnap/widgets/countryCode/country_code.dart';
import 'package:scrapsnap/widgets/mobileNameTextField/enter_name_text_field.dart';
import 'package:scrapsnap/widgets/mobileNameTextField/mobile_number_field.dart';

class MobileNumberSigninView extends StatefulWidget {
  const MobileNumberSigninView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileNumberSigninViewState createState() => _MobileNumberSigninViewState();
}

class _MobileNumberSigninViewState extends State<MobileNumberSigninView> {
  final mobileNumberNameController = Get.put(MobileNumberNameController());
  final otpViewController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 330,
                height: 320.25,
                margin: const EdgeInsets.only(top: 107),
                child: SvgPicture.asset("assets/signInNumber/signInNumber.svg"),
              ),
              const SizedBox(
                height: 36.75,
              ),
              Text(
                "entername&mobile".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mobileSignInTitleTextColor),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "signinwithnumber".tr,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColors.mobileSignInSubtitleTextColor),
              ),
              const EnterNameTextField(),
              const SizedBox(
                height: 24,
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountryCode(),
                  MobileNumberField(),
                ],
              ),
              ElevatButtonWidget(
                text: "Verify Using OTP",
                onPressed: () {
                  if (mobileNumberNameController
                          .mobileNumberController.value.text.isNotEmpty &&
                      mobileNumberNameController
                          .nameController.value.text.isNotEmpty) {
                    Get.toNamed(RoutesName.otpView);
                    mobileNumberNameController.randomeOTP();
                  } else {
                    Get.snackbar(
                        "Error", "Please enter Name and mobile number");
                  }
                },
                width: 333,
                height: 47,
                topMargin: 24,
              ),
              const SizedBox(
                height: 37,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "terms&conditionask".tr,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mobileSignInSubtitleTextColor),
                  ),
                  InkWell(
                      child: Text(
                    "terms&condition".tr,
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.elevatedButtonBackgroundColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            AppColors.elevatedButtonBackgroundColor),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
