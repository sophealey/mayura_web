import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/catalog/catalog_controller.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/page/home/home_page.dart';
import 'package:mayura_web/utils/locale_string.dart';
import 'package:mayura_web/utils/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      title: 'Mayura Flutter',
      debugShowCheckedModeBanner: false,

      themeMode: themeController.theme,
      translations: LocaleString(),
      supportedLocales: [
        Locale('en'), // Spanish, no country code
        Locale('km'), // Spanish, no country code
      ],
      locale: themeController.localization,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),

          // binding: ControllerBinding(),
        ),
        GetPage(name: '/second', page: () => CatalogPage()),
      ],
      initialBinding: ControllerBinding(),
    );
  }
}

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CatalogController());
   // Get.create<CatalogController>(() => CatalogController());

  }
}