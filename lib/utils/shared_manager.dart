
import 'package:get/get.dart';

class SharedManager {
  static String? fcmToken;
  static var isSignedIn = false.obs;
  static var locale = 'km';
  static var language = 'kh';
 // static var accountData = AccountResponse().obs;
  static RxList selectedCategory = [].obs;
//  static RxList<HomeMenu> homeMenus = <HomeMenu>[].obs;
  static String? pushedProId;
  static var cartBadge = 0.obs;
}
