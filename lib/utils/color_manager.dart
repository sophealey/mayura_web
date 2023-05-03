import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors_list.dart';

class ColorManager {
  static Color getNavigationColor() {
    return Get.isDarkMode ? kBgDarkMode : kPrimaryColor;
  }

  static Color getTextFormBGColor() {
    return Get.isDarkMode ? kDarkBackGroundColor : kBackGroundColor;
  }

  static Color getWhiteBlack() {
    return Get.isDarkMode ? Colors.black : Colors.white;
  }

  static Color getBaseColorWhite() {
    return Get.isDarkMode ? Colors.white : kPrimaryColor;
  }

  static Color getWhiteDark() {
    return Get.isDarkMode ? kBgDarkMode : Colors.white;
  }

  static Color getGrayBlack() {
    return Get.isDarkMode ? kDarkBackGroundColor : kBackGroundColor;
  }

  static Color getBlack54White() {
    return Get.isDarkMode ? Colors.white : Colors.black54;
  }

  static Color getBlackWhite() {
    return Get.isDarkMode ? Colors.white : Colors.black;
  }

  static Color getLightPurpleDarkGrey() {
    return Get.isDarkMode ? Color(0xff1f1f1f) : kLightPurple;
  }

  static Color getWhiteLightGrey() {
    return Get.isDarkMode ? klightGrey : Colors.white;
  }

  static Color getPurpleWhite() {
    return Get.isDarkMode ? Colors.white : kPrimaryColor;
  }

  static Color getDarkGreyBlack() {
    return Get.isDarkMode ? Colors.black : Colors.black26;
  }

  static Color getLightGreyDarkGrey() {
    return Get.isDarkMode ? Colors.white70 : Colors.black87;
  }

  static Color getLightGrey() {
    return Get.isDarkMode ? Colors.white12 : Colors.black12;
  }

  static Color getBlack26White54() {
    return Get.isDarkMode ? Colors.white54 : Colors.black26;
  }

  static Color getColorTextGrey() {
    return Get.isDarkMode ? Colors.white54 : const Color(0xff494949);
  }

  static Color getPurpleLightPurple() {
    return Get.isDarkMode ? const Color(0xffb483f3) : const Color(0xff69409e);
  }

  static Color getBlack45White54() {
    return Get.isDarkMode ? Colors.white54 : Colors.black45;
  }

  static Color getLightPuple() {
    return Get.isDarkMode ? Color(0xff5a486c) : kLightPurple;
  }

  static Color getShadowColorForBox() {
    return Get.isDarkMode ? Colors.white54 : Colors.black12;
  }
  static Color getBlueLightBlue() {
    return Get.isDarkMode ? kLogoLightBlue : kLogoBlue;
  }

  static Color getPinkLightPink() {
    return Get.isDarkMode ? kLogoLightPink : kLogoPink;
  }
  static Color getGreenLightGreen() {
    return Get.isDarkMode ? kLogoLightGreen : kLogoGreen;
  }
  static Color getYellowLightYellow() {
    return Get.isDarkMode ? kLogoLightYellow : kLogoYellow;
  }
  static Color getWhiteGrey() {
    return Get.isDarkMode ? Color(0xff1f1f1f) : Colors.white;
  }

  static Color getShimmerBaseColor() {
    return Get.isDarkMode ? Color(0xff424242) : Color(0xffE0E0E0);
  }
  static Color getShimmerHighlightColor() {
    return Get.isDarkMode ? Color(0xff494949) : Color(0xffeae9e9);
  }
}