import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/res/routes/routes_name.dart';
import 'package:scrapsnap/view/onBoadingView/onboading_page.dart';
import 'package:scrapsnap/view_model/controller/onboading_controller.dart';
import 'package:scrapsnap/widgets/buttons/elevat_button_widget.dart';
import 'package:scrapsnap/widgets/buttons/text_button_widget.dart';

class OnBoadingView extends StatefulWidget {
  const OnBoadingView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoadingViewState createState() => _OnBoadingViewState();
}

class _OnBoadingViewState extends State<OnBoadingView> {
  final onBoadingController = Get.put(OnboadingController());
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onBoadingContent = [
      {
        "image": "assets/onboading/onboading1.svg",
        "text": "onboading1TitleText",
        "subtitle": "onboadingSubtitleText"
      },
      {
        "image": "assets/onboading/onboading2.svg",
        "text": "onboading2TitleText",
        "subtitle": "onboadingSubtitleText"
      },
      {
        "image": "assets/onboading/onboading3.svg",
        "text": "onboading3TitleText",
        "subtitle": "onboadingSubtitleText"
      },
      {
        "image": "assets/onboading/onboading4.svg",
        "text": "onboading4TitleText",
        "subtitle": "onboadingSubtitleText"
      }
    ];

    return Scaffold(
      backgroundColor: AppColors.appBackColor,
      body: Stack(
        children: [
          Obx(
            () => Container(
              margin: EdgeInsets.only(
                top: onBoadingController.containerTopMargin.value,
              ),
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoadingContent.length,
                onPageChanged: (index) {
                  setState(() {
                    onBoadingController.currentPage.value = index;
                  });
                  onBoadingController.changeContainerTopMargin(index);
                },
                itemBuilder: (context, index) {
                  return OnboadingPage(
                    image: onBoadingContent[index]["image"]!,
                    text: onBoadingContent[index]["text"]!,
                    subtitle: onBoadingContent[index]["subtitle"]!,
                    pageCount: onBoadingController.currentPage.value,
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 102,
            left: 138,
            child: Obx(
              () => ElevatButtonWidget(
                currentPage: onBoadingController.currentPage.value,
                onPressed: () {
                  if (onBoadingController.currentPage.value <
                      onBoadingContent.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Get.toNamed(RoutesName.selectLanguageView);
                  }
                },
                text: onBoadingController.currentPage.value <
                        onBoadingContent.length - 1
                    ? "Next"
                    : ">",
              ),
            ),
          ),
          Obx(
            () => Positioned(
              top: 67,
              right: 26,
              child: onBoadingController.currentPage.value !=
                      onBoadingContent.length - 1
                  ? TextButtonWidget(
                      color: AppColors.textButtonTextColor,
                      text: "Skip",
                      onPress: () {
                        pageController.jumpToPage(
                          onBoadingContent.length - 1,
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
