import 'package:get/get.dart';
import 'package:mayura_web/page/home/home_service.dart';

import '../../model/home_menu.dart';
import '../../model/home_model.dart';
import '../../model/product_carousel_model.dart';
import '../../model/product_model.dart';

class HomeController extends SuperController {
  final homeService = HomeService();
  var homeModel = HomeModel().obs;
  var headerSlide = <Slide>[].obs;
  var homeMenus = <HomeMenu>[].obs;
  var popularCategories = <PopularCategory>[].obs;
  var brandModel = <Brand>[].obs;
  var popularShops = <PopularShop>[].obs;
  var bestSelling = <Product>[].obs;
  var selectedmainCat = 2.obs;
  var page = 1.obs;
  var productCarousel = ProductCarousel().obs;
  var carouselList = <Carousel>[].obs;
  var isLastCarouselRecord = false.obs;
  var isPullToRefresh = false.obs;
  var isFirstLoad = true.obs;

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
    var resp = await homeService.getHomeData(selectedmainCat.value);
    if (resp.success) {
      homeModel.value = resp.data;
      headerSlide.value = homeModel.value.slides ?? [];
      popularCategories.value = homeModel.value.popularCategory ?? [];
      brandModel.value = homeModel.value.brands ?? [];
      popularShops.value = homeModel.value.popularShop ?? [];
      bestSelling.value = homeModel.value.bestSelling ?? [];
      print('slide99 ${headerSlide.length}');
    } else {
      print('fail');
    }
    getCarouselProduct();
  }

  Future<void> getCarouselProduct() async {
    var response = await homeService.getProductCarousel(selectedmainCat.value, page.value);
    if (response.success ?? false) {
      productCarousel.value = response.data;
      if (page.value == 1) {
        carouselList.value = productCarousel.value.products ?? [];
      } else {
        carouselList.addAll(productCarousel.value.products ?? []);
      }

      isLastCarouselRecord.value = (productCarousel.value.products ?? []).isEmpty;
      printInfo(info: 'list size : ${carouselList.length}');
    } else {
      // showRetry(
      //     message: response.message ?? '',
      //     retryButton: () async {
      //       getCarouselProduct();
      //     });
      // logError(response.message ?? '');
    }
    // isLoading.value = false;
    isPullToRefresh.value = false;
  }

  int carouselCount(int index) {
    return (carouselList[index].items?.length ?? 0) >= 4 ? 4 : (carouselList[index].items?.length ?? 0);
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
