import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/view_model/controller/mobileNumberController/mobile_number_name_controller.dart';
import 'package:scrapsnap/view_model/controller/otpController/otp_view_controller.dart';
import 'package:scrapsnap/widgets/buttons/elevat_button_widget.dart';
import 'package:scrapsnap/widgets/buttons/text_button_widget.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final mobileNumnerViewController = Get.put(MobileNumberNameController());
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
                margin: const EdgeInsets.only(top: 102),
                child: SvgPicture.asset("assets/otpView/otpView.svg"),
              ),
              const SizedBox(height: 37.25),
              Text(
                "OTP",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.otpTextColor),
              ),
              const SizedBox(
                height: 6,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "otpsentis".tr,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: OtpController.markMobileNumber(
                        mobileNumnerViewController
                            .mobileNumberController.value.text
                            .toString(),
                      ),
                    ),
                    TextSpan(text: "pleaseinput".tr),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Pinput(
                length: 4,
                onCompleted: (value) {
                  otpViewController.otpTextController.value.text = value;
                },
                defaultPinTheme: otpViewController.defaulTheme(),
                controller: otpViewController.otpTextController.value,
              ),
              ElevatButtonWidget(
                text: "Submit",
                onPressed: () {
                  otpViewController.otpValidation();
                },
                topMargin: 72.19,
                width: 333,
                height: 45,
              ),
              TextButtonWidget(
                text: "Resend OTP",
                onPress: () {
                  mobileNumnerViewController.randomeOTP();
                },
                topMargin: 6,
                width: 150,
                color: AppColors.splashScreenBackColor,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                TextSpan(
                  children: [
                    TextSpan(text: 'mobilenumberwrong'.tr),
                    TextSpan(
                      text: "enteragain".tr,
                      style: TextStyle(
                          fontSize: 13, color: AppColors.splashScreenBackColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutesName.mobileSignInView);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
