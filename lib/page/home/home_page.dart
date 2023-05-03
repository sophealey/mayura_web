import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/color_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        backgroundColor: ColorManager.getGrayBlack(),
        appBar: AdaptiveNavBar(
          backgroundColor: Colors.red,
          screenWidth:  MediaQuery.of(context).size.width, navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),

          NavBarItem(
            text: "Catalog",
            onTap: () {
          //    Navigator.pushNamed(context, "catalog_page");
              Get.to(CatalogPage(), routeName: 'catalog');
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
              Get.toNamed("/second");
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              Navigator.pushNamed(context, "routeName");

            },
          ),
        ],
        ),
        body: Container(
          child: Text('Text'),
        )


      ),
    );
  }
}
