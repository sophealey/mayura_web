

import 'package:flutter/cupertino.dart';
import 'package:mayura_web/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:mayura_web/model/product_detail_model.dart';
import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/product_detail/product_detail_service.dart';
import 'package:mayura_web/utils/shared_manager.dart';

class ProductDetailController extends BaseController {

  var currentPage = 0.obs;
  var proId = ''.obs;
  var imgPath = ''.obs;
  var heroTag = '';
  var isShowDefaultImg = true.obs;
  var qty = 1.obs;
  var isQtyNotAvailable = false.obs;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Rx<ProductDetail> productDetail = ProductDetail().obs;
  Rx<FlashSaleModelProductDetail> flashsale = FlashSaleModelProductDetail().obs;
  var imageList = <ImageItem>[].obs;

  //count down
  var dateTimeStart = DateTime.now().obs;
  var dateTimeEnd = DateTime.now().obs;

  ///check for iOS Keyboard done button
  // FocusNode numberFocusNode = FocusNode();
  var isShowKeyboard = false.obs;

  ProductDetailService productDetailService = ProductDetailService();

  var isFollowing = false.obs;
  var isAddToWishList = false.obs;
  var isAddingToCart = false.obs;

  var catIds = <SubCategory>[].obs;
  var relateProductResponse = RelateProduct().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // getProDetail();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


  }


  Future<void> getProDetail() async {
    print('getprodetail99');
    isLoading.value = true;
    var response = await productDetailService.getProductDetailById(proId.value);
    if (response.success ?? false) {
      isLoading.value = false;
      productDetail.value = response.data;

      flashsale.value = productDetail.value.flashSale!;
      isFollowing.value = productDetail.value.shop?.isFollow ?? false;
      isAddToWishList.value = productDetail.value.isWishlist ?? false;


      imageList.value = productDetail.value.image!;
      // imageList.insert(
      //     0,
      //     ImageItem(
      //         path:
      //             'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
      if (productDetail.value.quantity == 0) {
        qty.value = 0;

        //isQtyNotAvailable.value = true;
      } else {
        qty.value = 1;
        //isQtyNotAvailable.value = false;
      }

      // hide Default animated image
      // Future.delayed(const Duration(milliseconds: 1000), () {
      //   isShowDefaultImg.value = false;
      // });

    } else {
      isLoading.value = false;
    }
  }

}
