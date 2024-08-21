import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/language/languages.dart';
import 'package:scrapsnap/res/routes/routes.dart';
import 'package:scrapsnap/temp.dart';
import 'package:scrapsnap/view/address_view/address_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('English'),
      translations: Languages(),
      fallbackLocale: const Locale('English'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: AddressView(),
      getPages: Routes.appRoutes(),
    );
  }
}
