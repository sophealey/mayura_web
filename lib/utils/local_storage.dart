import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  final _box = GetStorage();
  final loginSession = "loginSession";
  final cartCount = 'cartCount';
  final bearerString = 'bearerString';
  final paymentMethodId = 'paymentMethodId';
  final firstLoad = 'firstLoad';
  final systemMode = 'isSystem';
  final recentSearch = 'recent';
  var list = [];

  void setLoginSession(int login) {
    _box.write(loginSession, login);
  }

  int? getLoginSession() => _box.read(loginSession) ?? 0;

  void setCartCount(int count) {
    _box.write(cartCount, count);
  }

  int? getCartCount() => _box.read(cartCount) ?? 0;

  void setBearer(String bearer) {
    _box.write(bearerString, bearer);
  }

  String getBearer() => _box.read(bearerString) ?? "";

  bool isSignedIn() {
    var bearer = _box.read(bearerString) ?? "";
    return bearer != "";
  }

  void setPaymentMethod(int id) {
    _box.write(paymentMethodId, id);
  }

  int getPaymentMethod() {
    return _box.read(paymentMethodId) ?? 0;
  }

  void setFirstLoad(bool isFirstLoad) {
    _box.write(firstLoad, isFirstLoad);
  }

  bool isFirstLoad() {
    return _box.read(firstLoad) ?? true;
  }

  void setSystemMode(bool isSystemMode) {
    _box.write(systemMode, isSystemMode);
  }

  bool isSystemMode() {
    return _box.read(systemMode) ?? false;
  }

  void setRecentSearch(List<dynamic> storageValue) {
    if (storageValue.length > 5) {
      storageValue.removeRange(4, storageValue.length - 1);
    }
    _box.write(recentSearch, json.encode(storageValue));
  }

  String? getRecentSearch() {
    return _box.read(recentSearch);
  }
}
