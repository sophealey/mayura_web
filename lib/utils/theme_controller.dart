import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mayura_web/utils/shared_manager.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  final language = 'language'.obs;

  //Get the theme mode from local storage
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  Locale get localization => getLanguage() == 'en'
      ? const Locale('en', 'US')
      : const Locale('kh', 'IN');
  void saveLanguage(String lang) {
    SharedManager.language = lang;
    _box.write(language.value, lang);
  }

  String getLanguage() => _box.read(language.value) ?? 'en';
}
