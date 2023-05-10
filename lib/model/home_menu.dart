import 'dart:convert';

HomeMenu homeMenuFromJson(String str) => HomeMenu.fromJson(json.decode(str));

String homeMenuToJson(HomeMenu data) => json.encode(data.toJson());

class HomeMenu {
  HomeMenu({
    this.id,
    this.sortOrder,
    this.name,
  });

  int? id;
  int? sortOrder;
  String? name;

  factory HomeMenu.fromJson(Map<String, dynamic> json) => HomeMenu(
        id: json["id"],
        sortOrder: json["sort_order"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sort_order": sortOrder,
        "name": name,
      };
}
