// const String endPoint = 'http://172.30.31.195';

// const String apiGetWay = 'http://v2-api-gateway.hlhmarketplace.com';
const String apiGetWay = 'http://gateway.mayura.com.kh';
// const String apiGetWay = 'http://172.30.31.69/mayura/api-gateway/public';
// 'http://172.30.31.13/mayura/api-gateway/public';
// 'http://mayura.mydemoapp.xyz/api-gateway';

class ApiEndPoint {
  // static const String searchSuggestion =
  //     'http://v2-api-product.hlhmarketplace.com/product-search?';
  static const String searchSuggestion = '$apiGetWay/product/product-search?';
  static const String customerById = '$apiGetWay/customer/customer-detail';
  // static const String productsByCat =
  //     'http://v2-api-product.hlhmarketplace.com/product-by-category';
  static const String productsByCat = '$apiGetWay/product/product-by-category?';
  // static const String productDetail =
  // 'http://v2-api-product.hlhmarketplace.com/product-detail';c
  static const String productDetail = '$apiGetWay/product/product-detail?';
  /*static const String productDetail =s
      '$apiGetWay/mayura/products/public/product-detail';*/
  static const String addToCart = '$apiGetWay/cart/add-cart';
  // static const String checkoutPaymentReview =
  //     'http://v2-api-cart.hlhmarketplace.com/payment';
  static const String checkoutPaymentReview = '$apiGetWay/cart/payment';
  static const String placeOrder = '$apiGetWay/cart/placeOrder';
  static const String succeedPlaceOrder = '$apiGetWay/cart/succeed-place-order';
  static const String categoryList = '$apiGetWay/category/getCategoryList';
  /*static const String productByShop =
      'http://v2-api-product.hlhmarketplace.com/product-by-shop';*/
  static const String productByShop = '$apiGetWay/product/product-by-shop';

  static const String shippingAddress = '$apiGetWay/cart/shipping-address';
  static const String favoriteShop = '$apiGetWay/customer/customer-follow';
  static const String addFavoriteShop = '$apiGetWay/customer/create-customer-follow';
  static const String unfollowFavoriteShop = '$apiGetWay/customer/customer-unfollow';
  static const String homePage = '$apiGetWay/product/get-home-data?';
  static const String homeMenu = '$apiGetWay/home/home-menu?';
  static const String flashSale = '$apiGetWay/home/flash-sale?';
  static const String upcomingFlashSale = '$apiGetWay/home/up-coming-flash-sale?';

  static const String carouselProduct = '$apiGetWay/product/product-carousel?';
  static const String carouselProductById = '$apiGetWay/product/product-by-carousel?';
  static const String specialOfferProducts = '$apiGetWay/product/product-by-offer?';
  static const String productByBrand = '$apiGetWay/product/product-by-brand?';
  static const String relateProductList = '$apiGetWay/product/related-product';

  //Cart
  // static const String cartList =
  //     'http://v2-api-cart.hlhmarketplace.com/cart-list?';
  static const String cartList = '$apiGetWay/cart/cart-list?';
  static const String updateCart = '$apiGetWay/cart/update-cart';
  static const String deleteCart = '$apiGetWay/cart/delete-cart';

  static const String recentViewProductsList = '$apiGetWay/product/product-recent-view';
  static const String viewProduct = '$apiGetWay/customer/view-product';
  static const String couponList = '$apiGetWay/customer/coupon-list';
  static const String orderCouponList = '$apiGetWay/cart/order-coupon-list?';
  static const String applyCoupon = '$apiGetWay/cart/apply-coupon-code?';
  static const String removeCoupon = '$apiGetWay/cart/remove-coupon?';
  static const String orderedList = '$apiGetWay/customer/order-list';
  static const String orderDetail = '$apiGetWay/customer/order/';
  static const String reorderList = '$apiGetWay/customer/pre-order-item?';
  static const String reOrderProduct = '$apiGetWay/customer/re-order';
  static const String reviewProduct = '$apiGetWay/product/review-product?';
  static const String getReviewOrder = '$apiGetWay/customer/review-item?language=en';
  static const String reviewOrder = '$apiGetWay/customer/review-order';
  static const String cancelOrder = '$apiGetWay/customer/cancel-order';
  static const String cancelReason = '$apiGetWay/customer/cancel-reason';

  static const String addressList = '$apiGetWay/customer/address-list?';
  static const String createAddress = '$apiGetWay/customer/createAddress';
  static const String deleteAddress = '$apiGetWay/customer/removeAddress';
  static const String updateAddress = '$apiGetWay/customer/update-address';
  static const String setDefaultAddress = '$apiGetWay/customer/set-default-address';

  static const String login = '$apiGetWay/auth/phone';
  static const String logout = '$apiGetWay/auth/logout';
  static const String deleteAccount = '$apiGetWay/auth/delete-account';

  static const String loginToken = '$apiGetWay/oauth/token';
  static const String createProfile = '$apiGetWay/customer/createProfile';

  static const String wishList = '$apiGetWay/customer/wishlist?language=en';
  static const String addToWishList = '$apiGetWay/customer/add-wishlist';
  static const String removeFromWishList = '$apiGetWay/customer/remove-wishlist?';
  static const String notificationList = '$apiGetWay/notification/notification-list?';
  static const String personalNotificationList = '$apiGetWay/notification/personal-notification-list?';

  static const String reviewProductList = '$apiGetWay/product/product-review-list?';

  static const String customerLogs = '$apiGetWay/customer/customer-log';
  static const String submitContactUsForm = '$apiGetWay/customer/contact-form';
  static const String brandList = '$apiGetWay/product/brand-list?';
  static const String faqList = '$apiGetWay/faq/faq-list?';

  static const String shopList = '$apiGetWay/product/popular-shop-list';
}
