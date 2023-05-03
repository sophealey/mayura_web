import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayura_web/main.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../utils/local_storage.dart';

class BaseController extends SuperController {
  final localStorageController = Get.find<LocalStorageController>();
  var isLoading = false.obs;

  Future<dynamic>? lunchScreen(dynamic screen) {
    return Get.to(
      screen,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
      binding: ControllerBinding(),
    );
  }

  Future<dynamic>? lunchScreenWithArgument(dynamic screen, {dynamic arguments}) {
    return Get.to(
      screen,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
      binding: ControllerBinding(),
      arguments: arguments,
    );
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }


}
