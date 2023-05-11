import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/home/components/popular_brand.dart';
import 'package:mayura_web/page/home/home_controller.dart';

import '../../../utils/product_tile.dart';
import '../../../utils/responsive_widget.dart';

class ProductCarouselView extends GetView<HomeController> {
  const ProductCarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => ListView.builder(
          // controller: onScrollController(),
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.carouselList.length,
          itemBuilder: (context, index) {
            // controller.animateController.animationControllerList1.add(<AnimationController>[]);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    // controller.persistentLunchScreen(
                    //     context,
                    //     CatalogScreen(
                    //       keyword: '',
                    //       keyIds: [controller.carouselList[index].id ?? 0],
                    //       categoryName: controller.carouselList[index].name ?? '',
                    //       proType: ProType.byCarousel,
                    //     ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.carouselList[index].name ?? '',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Visibility(
                          visible: (controller.carouselList[index].items ?? []).length > 3,
                          child: const ViewAllBox(),
                        )
                      ],
                    ),
                  ),
                ),

                /**
               * when there are less than 4 product, show in listview horizontal
               * if greater than 4, use gridview
               * */

                Obx(() => Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: AlignedGridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: onScrollController(),
                          itemCount: controller.carouselCount(index),
                          crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 2 : 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemBuilder: (context, proIndex) {
                            // controller.animateController.animationControllerList1[index].add(controller.animateController.getAnimationController());

                            return ProductTile(controller.carouselList[index].items![proIndex], () {});
                          }),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
