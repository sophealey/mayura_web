// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'dart:convert';

class CatalogModel {
  CatalogModel({
    this.minPrice,
    this.maxPrice,
    this.categories,
    this.brands,
    this.products,
    this.priceRang,
    this.total,
  });

  double? minPrice;
  double? maxPrice;
  List<SubCategory>? categories;
  List<SubCategory>? brands;
  List<Product>? products;
  List<PriceRang>? priceRang;
  int? total;

  factory CatalogModel.fromJson(Map<String, dynamic> json) => CatalogModel(
        minPrice: (json["min_price"] ?? 0).toDouble(),
        maxPrice: (json["max_price"] ?? 0).toDouble(),
        categories: List<SubCategory>.from(json["categories"]?.map((x) => SubCategory.fromJson(x)) ?? []),
        brands: List<SubCategory>.from(json["brands"]?.map((x) => SubCategory.fromJson(x)) ?? []),
        products: List<Product>.from(json["products"]?.map((x) => Product.fromJson(x)) ?? []),
        priceRang: List<PriceRang>.from(json["price_rang"]?.map((x) => PriceRang.fromJson(x)) ?? []),
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        "min_price": minPrice,
        "max_price": maxPrice,
        "categories": List<dynamic>.from(categories?.map((x) => x.toJson()) ?? []),
        "brands": List<dynamic>.from(brands?.map((x) => x.toJson()) ?? []),
        "products": List<dynamic>.from(products?.map((x) => x.toJson()) ?? []),
        "price_rang": List<dynamic>.from(priceRang?.map((x) => x.toJson()) ?? []),
        "total": total,
      };
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.name,
    this.brand,
    this.type,
    this.sku,
    this.fbm,
    this.price,
    this.specialPrice,
    this.priceFormat,
    this.specialPriceFormat,
    this.quantity,
    this.qty,
    this.shopSku,
    this.url,
    this.status,
    this.thumbnail,
    this.firstImage,
    this.isWishlist,
    this.discount,
    this.specialFromDate,
    this.specialToDate,
    this.starRate,
    this.rateNumber,
    this.dropShippingCountry,
    this.dropShippingTime,
    this.showDiscountPrice,
    this.finalPrice,
    this.isShowDisount = false,
    this.isShowFBM = false,
    this.isSelectForReorder,
    this.stock,
    this.isAvailableToReOrder,
    this.isShowMsgAvailableToReOrder,
    this.productId,
    this.isShowOfStock,
  });

  int? id;
  int? productId;
  String? name;
  String? brand;
  String? type;
  String? sku;
  int? fbm;
  dynamic price;
  dynamic specialPrice;
  String? priceFormat;
  String? specialPriceFormat;
  int? quantity;
  dynamic shopSku;
  String? url;
  String? status;
  String? thumbnail;
  String? firstImage;
  bool? isWishlist;
  dynamic discount;
  String? specialFromDate;
  String? specialToDate;
  String? starRate;
  int? rateNumber; //amount of user who rate
  String? dropShippingCountry;
  String? dropShippingTime;

  //for reorder model
  int? stock;
  int? qty;
  RxBool? isAvailableToReOrder;
  RxBool? isShowMsgAvailableToReOrder;
  RxInt? qtyForReorder = 0.obs;
  RxBool? isSelectForReorder;

  String? showDiscountPrice;
  String? finalPrice;
  bool? isShowDisount;
  bool isShowFBM;
  bool? isShowOfStock = false;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productId: json["product_id"],
    name: (json["name"] ?? '').trim(),
    brand: json["brand"],
    type: json["type"],
    sku: json["sku"],
    fbm: json["fbm"],
    price: json["price"],
    specialPrice: json["special_price"],
    priceFormat: json["price_format"],
    specialPriceFormat: json["special_price_format"],
    quantity: json["quantity"] ?? 0,
    qty: json["qty"] ?? 0,
    shopSku: json["shop_sku"],
    url: json["url"],
    status: json["status"],
    thumbnail: json["thumbnail"],
    firstImage: json["first_image"],
    isWishlist: json["is_wishlist"],
    discount: json["discount"],
    specialFromDate: json["special_from_date"],
    specialToDate: json["special_to_date"],
    starRate: json["star_rate"],
    rateNumber: json["rate_number"],
    dropShippingCountry: json["drop_shipping_country"],
    dropShippingTime: json["drop_shipping_time"],
    showDiscountPrice: json["discount"] > 0 ? json["price_format"].toString() : '',
    finalPrice: json["discount"] > 0 ? json["special_price_format"].toString() : json["price_format"].toString(),
    isShowDisount: json["discount"] > 0 ? true : false,
    isShowFBM: json["fbm"] == 1 ? true : false,
    //model for reorder product
    stock: json["stock"] ?? 0,
    isSelectForReorder: json["stock"] == null ? false.obs : (json["stock"] >= (json["qty"] ?? 0) ? true.obs : false.obs),
    isAvailableToReOrder: json["stock"] == null ? false.obs : (json["stock"] >= (json["qty"] ?? 0) ? true.obs : false.obs),
    isShowMsgAvailableToReOrder: json["stock"] == null ? false.obs : (json["stock"] >= (json["qty"] ?? 0) ? false.obs : true.obs),
    isShowOfStock: json["quantity"] == null
        ? false
        : json["quantity"] <= 0
        ? true
        : false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "name": name,
    "brand": brand,
    "type": type,
    "sku": sku,
    "fbm": fbm,
    "price": price,
    "special_price": specialPrice,
    "price_format": priceFormat,
    "special_price_format": specialPriceFormat,
    "quantity": quantity,
    "qty": qty,
    "shop_sku": shopSku,
    "url": url,
    "status": status,
    "thumbnail": thumbnail,
    "first_image": firstImage,
    "is_wishlist": isWishlist,
    "discount": discount,
    "special_from_date": specialFromDate,
    "special_to_date": specialToDate,
    "star_rate": starRate,
    "rate_number": rateNumber,
    "drop_shipping_country": dropShippingCountry,
    "drop_shipping_time": dropShippingTime,
    "stock": stock,
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.isChecked,
  });

  int id;
  String name;
  RxBool isChecked;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        isChecked: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class PriceRang {
  PriceRang({
    this.price,
    this.total,
  });

  double? price;
  int? total;

  factory PriceRang.fromJson(Map<String, dynamic> json) => PriceRang(
        price: json["price"].toDouble(),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "total": total,
      };
}
