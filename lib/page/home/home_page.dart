import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/color_manager.dart';

import '../../utils/colors_list.dart';
import '../../utils/components/category_component.dart';
import '../../utils/components/slogan_view.dart';
import '../../utils/components/top_bar_view.dart';
import '../../utils/responsive_widget.dart';
import 'components/popular_brand.dart';
import 'components/popular_category_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Theme(
        data: Theme.of(context),
        child: Scaffold(
          backgroundColor: Colors.white, //ColorManager.getGrayBlack(),
          appBar: ResponsiveWidget.isSmallScreen(context)
              ? AppBar(
                  iconTheme: IconThemeData(color: kPrimaryColor),
                  title: Text(
                    'Mayura',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
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
                            height: 40,
                          ),
                          PopularCategory(),
                          SizedBox(
                            height: 10,
                          ),
                          PopularBrand(),
                          PopularCategory(),
                          PopularCategory(),
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
