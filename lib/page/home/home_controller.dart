import 'package:get/get.dart';
import 'package:mayura_web/page/home/home_service.dart';

import '../../model/home_menu.dart';
import '../../model/home_model.dart';

class HomeController extends SuperController {
  final homeService = HomeService();
  var homeModel = HomeModel().obs;
  var headerSlide = <Slide>[].obs;
  var homeMenus = <HomeMenu>[].obs;
  var popularCategories = <PopularCategory>[].obs;
  var brandModel = <Brand>[].obs;
  var popularShops = <PopularShop>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  Future<void> getHomeData() async {
    await fetchHomeMenu();
    await fetchHomeData();
  }

  Future<void> fetchHomeMenu() async {
    var response = await homeService.fetchHomeMenu();
    if (response.success) {
      var homeMenu = response.listObject as List<HomeMenu>;
      homeMenus.value = homeMenu;
      print('menu99 ${homeMenu.length}');
    }
  }

  Future<void> fetchHomeData() async {
    var resp = await homeService.getHomeData(1);
    if (resp.success) {
      homeModel.value = resp.data;
      headerSlide.value = homeModel.value.slides ?? [];
      popularCategories.value = homeModel.value.popularCategory ?? [];
      brandModel.value = homeModel.value.brands ?? [];
      popularShops.value = homeModel.value.popularShop ?? [];
      print('slide99 ${headerSlide.length}');
    } else {
      print('fail');
    }
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
