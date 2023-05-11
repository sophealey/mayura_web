// To parse this JSON data, do
//
//     final productCarousel = productCarouselFromJson(jsonString);

import 'dart:convert';

import 'package:mayura_web/model/product_model.dart';

ProductCarousel productCarouselFromJson(String str) => ProductCarousel.fromJson(json.decode(str));

String productCarouselToJson(ProductCarousel data) => json.encode(data.toJson());

class ProductCarousel {
  ProductCarousel({
    this.products,
    this.total,
  });

  List<Carousel>? products;
  int? total;

  factory ProductCarousel.fromJson(Map<String, dynamic> json) => ProductCarousel(
        products: List<Carousel>.from(json["products"].map((x) => Carousel.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products?.map((x) => x.toJson()) ?? []),
        "total": total,
      };
}

class Carousel {
  Carousel({
    this.id,
    this.name,
    this.items,
  });

  int? id;
  String? name;
  List<Product>? items;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"],
        name: (json["name"] ?? '').trim(),
        items: List<Product>.from(json["items"]?.map((x) => Product.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": List<dynamic>.from(items?.map((x) => x.toJson()) ?? []),
      };
}
