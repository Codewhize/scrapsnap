import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view/widgets/textformfield/enter_name_text_field.dart';

class MobileNumberSigninView extends StatefulWidget {
  const MobileNumberSigninView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileNumberSigninViewState createState() => _MobileNumberSigninViewState();
}

class _MobileNumberSigninViewState extends State<MobileNumberSigninView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 20,
              ),
              const MobileNumberSigninView()
            ],
          ),
        ),
      ),
    );
  }
}
