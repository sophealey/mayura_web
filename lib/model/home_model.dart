import 'package:azlistview/azlistview.dart';
import 'package:mayura_web/model/product_model.dart';

class HomeModel {
  HomeModel({this.slides, this.brands, this.popularCategory, this.popularShop, this.specialOffer, this.recentView, this.bestSelling, this.flashSale, this.upComingFlashSale});

  List<Slide>? slides;
  List<Brand>? brands;
  List<PopularCategory>? popularCategory;
  List<PopularShop>? popularShop;
  List<SpecialOffer>? specialOffer;
  // CouponResponseModel? newUserCoupon;
  List<RecentView>? recentView;
  List<Product>? bestSelling;
  List<FlashSaleModel>? flashSale;
  List<FlashSaleModel>? upComingFlashSale;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        slides: List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        popularCategory: List<PopularCategory>.from(json["popular_category"].map((x) => PopularCategory.fromJson(x))),
        popularShop: List<PopularShop>.from(json["popular_shop"].map((x) => PopularShop.fromJson(x))),
        specialOffer: List<SpecialOffer>.from(json["special_offer"].map((x) => SpecialOffer.fromJson(x))),
        flashSale: List<FlashSaleModel>.from(json["flash_sale"].map((x) => FlashSaleModel.fromJson(x))),
        upComingFlashSale: List<FlashSaleModel>.from(json["up_coming_flash_sale"].map((x) => FlashSaleModel.fromJson(x))),
        /*recentView: List<RecentView>.from(
            json["recent_view"].map((x) => RecentView.fromJson(x))),*/

        bestSelling: List<Product>.from(json["best_selling"].map((x) => Product.fromJson(x))),
        // TODO: need to remove this fix data to use real from server
        // newUserCoupon: CouponResponseModel(
        //   id: 3,
        //   couponCode: 'MAYURA USER',
        //   flat: 1,
        //   percent: 0,
        // ), //NewUserCoupon.fromJson(json["new_user_coupon"]),
      );

  Map<String, dynamic> toJson() => {
        "slides": List<dynamic>.from(slides!.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "popular_category": List<dynamic>.from(popularCategory!.map((x) => x.toJson())),
        "special_offer": List<dynamic>.from(specialOffer!.map((x) => x.toJson())),
        // "new_user_coupon": newUserCoupon!.toJson(),
        // "recent_view": List<dynamic>.from(recentView!.map((x) => x.toJson())),
        "best_selling": List<dynamic>.from(bestSelling!.map((x) => x.toJson())),
        "flash_sale": List<dynamic>.from(flashSale?.map((x) => x.toJson()) ?? []),
        "up_coming_flash_sale": List<dynamic>.from(upComingFlashSale?.map((x) => x.toJson()) ?? []),
      };
}

class Brand extends ISuspensionBean {
  Brand({
    this.id,
    this.name,
    this.icon,
    this.tagName,
  });

  int? id;
  String? name;
  String? icon;
  String? tagName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        tagName: (json["name"] == null || json["name"] == '') ? '' : json["name"][0].toString().toUpperCase(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "tagName": tagName,
      };

  @override
  String getSuspensionTag() {
    // TODO: implement getSuspensionTag
    return tagName ?? '';
    throw UnimplementedError();
  }
}

class NewUserCoupon {
  NewUserCoupon({
    this.id,
    this.code,
    this.percent,
    this.flat,
    this.value,
  });

  int? id;
  String? code;
  String? percent;
  String? flat;
  String? value;

  factory NewUserCoupon.fromJson(Map<String, dynamic> json) => NewUserCoupon(
        id: json["id"],
        code: json["code"],
        percent: json["percent"],
        flat: json["flat"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "percent": percent,
        "flat": flat,
        "value": value,
      };
}

class PopularCategory {
  PopularCategory({
    this.id,
    this.banner,
    this.icon,
    this.level,
    this.categoryCode,
    this.position,
    this.name,
  });

  int? id;
  String? banner;
  String? icon;
  int? level;
  String? categoryCode;
  int? position;
  String? name;

  factory PopularCategory.fromJson(Map<String, dynamic> json) => PopularCategory(
        id: json["id"],
        banner: json["banner"],
        icon: json["icon"],
        level: json["level"],
        categoryCode: json["category_code"],
        position: json["position"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "icon": icon,
        "level": level,
        "category_code": categoryCode,
        "position": position,
        "name": name,
      };
}

class PopularShop {
  PopularShop({
    this.id,
    this.name,
    this.logo,
    this.banner,
    this.isPopular,
  });

  int? id;
  String? name;
  String? logo;
  String? banner;
  int? isPopular;

  factory PopularShop.fromJson(Map<String, dynamic> json) => PopularShop(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        banner: json["banner"],
        isPopular: json["is_popular"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "banner": banner,
        "is_popular": isPopular,
      };
}

class RecentView {
  RecentView({
    this.id,
    this.name,
    this.thumbnail,
  });

  int? id;
  String? name;
  String? thumbnail;

  factory RecentView.fromJson(Map<String, dynamic> json) => RecentView(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
      };
}

class Slide {
  Slide({
    this.id,
    this.type,
    this.name,
    this.photo,
  });

  String? id;
  String? type;
  String? name;
  String? photo;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"].toString(),
        type: json["type"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "photo": photo,
      };
}

class SpecialOffer {
  SpecialOffer({
    this.id,
    this.banner,
    this.name,
  });

  int? id;
  String? banner;
  String? name;

  factory SpecialOffer.fromJson(Map<String, dynamic> json) => SpecialOffer(
        id: json["id"],
        banner: json["banner"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "name": name,
      };
}

class FlashSaleModel {
  FlashSaleModel({
    this.id,
    this.shopId,
    this.name,
    this.banner,
    this.percent,
    this.flat,
    this.value,
    this.buyX,
    this.getX,
    this.product,
    this.startDate,
    this.endDate,
  });

  int? id;
  int? shopId;
  String? name;
  dynamic banner;
  int? percent;
  String? flat;
  String? startDate;
  String? endDate;
  dynamic value;
  dynamic buyX;
  dynamic getX;
  List<Product>? product;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) => FlashSaleModel(
        id: json["id"],
        shopId: json["shop_id"],
        name: json["name"],
        banner: json["banner"],
        percent: json["percent"],
        flat: json["flat"],
        value: json["value"],
        buyX: json["buy_x"],
        getX: json["get_x"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        product: json["products"] == null ? [] : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "name": name,
        "banner": banner,
        "percent": percent,
        "flat": flat,
        "value": value,
        "buy_x": buyX,
        "get_x": getX,
        "start_date": startDate,
        "end_date": endDate,
        "product": List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}
