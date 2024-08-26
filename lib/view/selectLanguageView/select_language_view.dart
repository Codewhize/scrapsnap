import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/widgets/bottomSheet/show_bottom_sheet.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectLanguageViewState createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Container(
        height: 254.89,
        width: 330,
        margin: const EdgeInsets.only(top: 82, left: 23),
        child: SvgPicture.asset("assets/selectLanguage/selectLanguage.svg"),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      builder: (BuildContext context) {
        return ShowBottomSheet();
      },
    );
  }
}
