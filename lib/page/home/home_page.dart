import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/page/home/components/best_selling_view.dart';
import 'package:mayura_web/page/home/components/popular_shop.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/color_manager.dart';

import '../../model/home_model.dart';
import '../../utils/colors_list.dart';
import '../../utils/components/category_component.dart';
import '../../utils/components/slogan_view.dart';
import '../../utils/components/top_bar_view.dart';
import '../../utils/responsive_widget.dart';
import 'components/account_view.dart';
import 'components/main_menu.dart';
import 'components/popular_brand.dart';
import 'components/popular_category_view.dart';
import 'components/product_carousel_view.dart';
import 'components/top_slideshow.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key) {
    controller.getHomeData();
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Theme(
        data: Theme.of(context),
        child: Scaffold(
          key: _key,
          // backgroundColor: Colors.white, //ColorManager.getGrayBlack(),
          appBar: ResponsiveWidget.isSmallScreen(context)
              ? AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  title: Text(
                    'Mayura',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.search),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                    InkWell(
                      onTap: () {
                        _key.currentState?.openEndDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                )
              : PreferredSize(
                  preferredSize: Size(screenSize.width, 150),
                  child: Column(
                    children: [
                      const MyAccountView(),
                      const TopBarContent(),
                    ],
                  ),
                ),
          drawer: Drawer(
            child: Column(
              children: [
                CategoryComponent(),
              ],
            ),
          ),
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            child: AccountView(),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 1140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: !ResponsiveWidget.isSmallScreen(context),
                      child: Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CategoryComponent(),
                            SizedBox(
                              height: 40,
                            ),
                            SloganView(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          MainMenu(),
                          SizedBox(
                            height: 20,
                          ),
                          TopSlideShow(),
                          SizedBox(
                            height: 40,
                          ),
                          PopularCategoryView(),
                          SizedBox(
                            height: 10,
                          ),
                          PopularBrand(),
                          SizedBox(
                            height: 10,
                          ),
                          PopularShopView(),
                          SizedBox(
                            height: 10,
                          ),
                          BestSelling(),

                          /**Start Carousel Product*/
                          SizedBox(
                            height: 10,
                          ),
                          ProductCarouselView(),
                          /**End Carousel Product */

                          // PopularCategory(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
