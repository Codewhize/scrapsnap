import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/utils/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Utils.getNavigate(3, RoutesName.onBoadingView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackColor,
      body: Center(
        child: SizedBox(
          width: 170,
          height: 205.86,
          child: SvgPicture.asset("assets/splashView/logo.svg"),
        ),
      ),
    );
  }
}
