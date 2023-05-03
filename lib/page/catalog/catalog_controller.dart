import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/page/catalog/catalog_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatalogController extends SuperController{

 var catalogService = CatalogService();
 var catalogData = CatalogModel().obs;
 var productList = <Product>[].obs;

 var productListExample = [].obs;
 var page = 1.obs;

 var isLastCarouselRecord = false.obs;
 ScrollController scrollController = ScrollController();

 RefreshController refreshController = RefreshController(initialRefresh: false);

 var isPullToRefresh = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    paginationListener();


  }
  Future<void> getProducts() async {

    var response = await catalogService.getProductsByCat(
      keyIds: [],
      categoryIds: [],
      brandIds: [],
      isFbm: false,
      isDiscount: false,
      isDropShipping: false,
      priceFilter: '',
      keyword:'',
      page: page.value,
      minPrice:  0.0,
      maxPrice:  0.0,
      isInStock: false,
    );
    if (response.success??false){
      catalogData.value = response.data ?? CatalogModel();
      productList.addAll(catalogData.value.products ?? []);

      printInfo(info: 'size mariya : ${productList.length}');

    }


  }
 paginationListener() async {
   scrollController.addListener(() {
    /* if (scrollController.offset >= 300) {
       showBackToTopButton.value = productList.isNotEmpty ? true : false; // show the back-to-top button
     } else {
       showBackToTopButton.value = false; // hide the back-to-top button
     }*/

     if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
       if (productList.length.isLowerThan(catalogData.value.total ?? 0)) {
         page.value += 1;
         getProducts();
       } else {
         isLastCarouselRecord.value = true;
       }
     }
   });
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