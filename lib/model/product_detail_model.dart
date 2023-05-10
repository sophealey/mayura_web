// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

import 'package:mayura_web/model/product_model.dart';

ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    this.id,
    this.name,
    this.type,
    this.sku,
    this.fbm,
    this.price,
    this.specialPrice,
    this.priceFormat,
    this.quantity,
    this.shopSku,
    this.url,
    this.status,
    this.thumbnail,
    this.isWishlist,
    this.attribute,
    this.discount,
    this.specialFromDate,
    this.specialToDate,
    this.dropShippingCountry,
    this.dropShippingTime,
    this.description,
    this.shop,
    this.image,
    this.finalPrice = '0',
    this.isShowDiscount = false,
    this.isInstock = false,
    this.productReviews,
    this.starRate,
    this.brand,
    this.lowestPrice,
    this.topProduct,
    this.flashSale,
  });

  int? id;
  String? name;
  String? type;
  String? sku;
  int? fbm;
  dynamic price;
  dynamic specialPrice;
  String? priceFormat;
  int? quantity;
  String? shopSku;
  String? url;
  String? status;
  String? thumbnail;
  bool? isWishlist;
  List<dynamic>? attribute;
  dynamic discount;
  dynamic specialFromDate;
  dynamic specialToDate;
  String? dropShippingCountry;
  String? dropShippingTime;
  String? description;
  Shop? shop;
  List<ImageItem>? image;
  List<ProductReviews>? productReviews;
  String? starRate;
  Brand? brand;
  String? lowestPrice;
  String? topProduct;
  FlashSaleModelProductDetail? flashSale;

  //not in response data
  dynamic finalPrice;
  bool isShowDiscount;
  bool isInstock;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        name: (json["name"] ?? '').trim(),
        type: json["type"],
        sku: json["sku"],
        fbm: json["fbm"],
        price: json["price"],
        specialPrice: json["special_price"],
        priceFormat: json["price_format"],
        quantity: json["quantity"],
        shopSku: json["shop_sku"],
        url: json["url"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        isWishlist: json["is_wishlist"],
        attribute: json["attribute"],
        discount: json["discount"],
        specialFromDate: json["special_from_date"],
        specialToDate: json["special_to_date"],
        dropShippingCountry: json["drop_shipping_country"],
        dropShippingTime: json["drop_shipping_time"],
        description: json["description"],
        shop: Shop.fromJson(json["shop"] ?? Shop().toJson()),
        image: List<ImageItem>.from(json["image"]?.map((x) => ImageItem.fromJson(x)) ?? []),
        productReviews: List<ProductReviews>.from(json["product_reviews"].map((x) => ProductReviews.fromJson(x))),
        starRate: json["star_rate"],
        //custom value
        finalPrice: json["discount"] > 0 ? json["special_price_format"] : json["price_format"],
        isShowDiscount: json["discount"] > 0 ? true : false,
        isInstock: json["quantity"] > 0 ? true : false,
        brand: Brand.fromJson(json["brand"] ?? Brand().toJson()),
        flashSale: FlashSaleModelProductDetail.fromJson(json["flash_sale"] == null ? FlashSaleModelProductDetail().toJson() : json["flash_sale"]),
        topProduct: json["top_product"],
        lowestPrice: json["lowest_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "sku": sku,
        "fbm": fbm,
        "price": price,
        "special_price": specialPrice,
        "price_format": priceFormat,
        "quantity": quantity,
        "shop_sku": shopSku,
        "url": url,
        "status": status,
        "thumbnail": thumbnail,
        "is_wishlist": isWishlist,
        "attribute": attribute,
        "discount": discount,
        "special_from_date": specialFromDate,
        "special_to_date": specialToDate,
        "drop_shipping_country": dropShippingCountry,
        "drop_shipping_time": dropShippingTime,
        "description": description,
        "shop": shop?.toJson(),
        "brand": brand?.toJson(),
        "flash_sale": flashSale?.toJson(),
        "top_product": topProduct,
        "lowest_price": lowestPrice,
        "image": image!.isEmpty ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "product_reviews": productReviews!.isEmpty ? [] : List<dynamic>.from(productReviews!.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    required this.color,
    required this.productSize,
  });

  List<Color> color;
  List<Color> productSize;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
        productSize: List<Color>.from(json["product_size"].map((x) => Color.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "color": List<dynamic>.from(color.map((x) => x.toJson())),
        "product_size": List<dynamic>.from(productSize.map((x) => x.toJson())),
      };
}

class Color {
  Color({
    this.name,
  });

  String? name;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ImageItem {
  ImageItem({
    this.id,
    this.productId,
    this.path,
    this.base,
    this.thumbnail,
    this.swatch,
  });

  int? id;
  int? productId;
  String? path;
  int? base;
  int? thumbnail;
  int? swatch;

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
        id: json["id"],
        productId: json["product_id"],
        path: json["path"] ?? '',
        base: json["base"],
        thumbnail: json["thumbnail"],
        swatch: json["swatch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "path": path,
        "base": base,
        "thumbnail": thumbnail,
        "swatch": swatch,
      };
}

class ProductReviews {
  ProductReviews({
    this.customer,
    this.comment,
    this.score,
    this.reviewDate,
  });

  String? customer;
  String? comment;
  String? score;
  String? reviewDate;

  factory ProductReviews.fromJson(Map<String, dynamic> json) => ProductReviews(
        customer: json["customer"],
        comment: json["comment"],
        score: json["score"],
        reviewDate: json["review_date"],
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "comment": comment,
        "score": score,
        "review_date": reviewDate,
      };
}

class Shop {
  Shop({
    this.name,
    this.url,
    this.logo,
    this.banner,
    this.bankInfo,
    this.fullAddress,
    this.id,
    this.isFollow,
  });

  String? name;
  String? url;
  String? logo;
  String? banner;
  String? bankInfo;
  String? fullAddress;
  int? id;
  bool? isFollow;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        name: json["name"],
        url: json["url"],
        logo: json["logo"],
        banner: json["banner"],
        bankInfo: json["bank_info"],
        fullAddress: json["full_address"],
        id: json["id"],
        isFollow: json["is_follow"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? '',
        "url": url ?? '',
        "logo": logo ?? '',
        "banner": banner ?? '',
        "bank_info": bankInfo ?? '',
        "full_address": fullAddress ?? '',
        "id": id ?? 0,
        "is_follow": isFollow ?? false,
      };
}

class RelateProduct {
  RelateProduct({
    this.products,
  });

  List<Product>? products;

  factory RelateProduct.fromJson(Map<String, dynamic> json) => RelateProduct(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Brand {
  Brand({this.id, this.name});

  int? id;
  String? name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? '',
        "id": id ?? 0,
      };
}

class ShopCategory {
  ShopCategory({
    this.id,
    this.name,
    this.icon,
    this.banner,
  });

  int? id;
  String? name;
  String? icon;
  String? banner;

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? '',
        "id": id ?? '',
        "icon": icon ?? '',
        "banner": banner ?? '',
      };
}

class FlashSaleModelProductDetail {
  FlashSaleModelProductDetail({
    this.id,
    this.shopId,
    this.name,
    this.banner,
    this.percent,
    this.flat,
    this.value,
    this.buyX,
    this.getX,
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

  factory FlashSaleModelProductDetail.fromJson(Map<String, dynamic> json) => FlashSaleModelProductDetail(
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
      };
}
