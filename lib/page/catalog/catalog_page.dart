import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_controller.dart';
import 'package:mayura_web/utils/product_tile.dart';
import 'package:mayura_web/utils/color_manager.dart';
import 'package:mayura_web/utils/responsive_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatalogPage extends StatelessWidget {
  final controller = Get.find<CatalogController>();
  CatalogPage({Key? key}) : super(key: key){
    controller.getProducts();

  }

  @override
  Widget build(BuildContext context) {
    printInfo(info: 'Screen :${MediaQuery.of(context).size.width}');
    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        backgroundColor: ColorManager.getGrayBlack(),
        appBar: AdaptiveNavBar(
          backgroundColor: ColorManager.getPurpleLightPurple(),
          actionsIconTheme: null,
          automaticallyImplyLeading: false,
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
              Get.off(CatalogPage(), routeName: 'catalog');
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
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
        body: /// Start List Products
        SmartRefresher(
          //  onRefresh: controller.onRefresh,
          controller: controller.refreshController,
          scrollController: controller.scrollController,
          enablePullDown: true,
          header: WaterDropMaterialHeader(
            backgroundColor: ColorManager.getPurpleLightPurple(),
          ),
          child: SingleChildScrollView(
            // controller: controller.scrollController,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => AlignedGridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // controller: controller.scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:  controller.productList.length,
                    crossAxisCount:  ResponsiveWidget.isSmallScreen(context) ? 2: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          controller.productList[index], (){

                      }
                      );
                    },
                  )),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}