import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/getx_localization/language.dart';
import 'package:scrapsnap/res/routes/routes.dart';
import 'package:scrapsnap/view/addressView/address_view.dart';
import 'package:scrapsnap/view/selectLanguageView/select_language_view.dart';
import 'package:scrapsnap/view/splashView/splash_view.dart';
import 'package:scrapsnap/view/temp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Language(),
      locale: const Locale("en"),
      fallbackLocale: const Locale("en"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
      getPages: Routes.appRoutes,
    );
  }
}
