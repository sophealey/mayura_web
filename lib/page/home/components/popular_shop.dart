import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/home/components/popular_brand.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../../../utils/StringConstant.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/colors_list.dart';
import '../../../utils/components/my_faded_image.dart';

class PopularShopView extends GetView<HomeController> {
  const PopularShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.popularShops.isNotEmpty,
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding: const EdgeInsets.only(top: 15, bottom: 5, right: 10, left: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              color: ColorManager.getWhiteDark(),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.1), // Shadow position
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        popularShops.tr.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // controller.persistentLunchScreen(context, ShopListScreen());
                      },
                      child: const ViewAllBox(),
                    )
                  ],
                ),
                Container(
                  height: controller.popularShops.length > 6 ? 200 : 100,
                  child: Obx(() => AlignedGridView.count(
                        // controller: shopScroller,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.popularShops.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // controller.persistentLunchScreen(
                                  //   context,
                                  //   // ShopCatalogScreen(controller.popularShops[index].id ?? 0, ''),
                                  // );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 5,
                                        color: Colors.black.withOpacity(0.1), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    child: Obx(
                                      () => MyFadedImage(
                                        imageUrl: controller.popularShops[index].logo ?? '',
                                        fit: BoxFit.fill,
                                        width: 90,
                                        height: 80,
                                        cacheWidth: 270,
                                        cacheHeight: 240,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        crossAxisCount: controller.popularShops.length > 6 ? 2 : 1,
                      )),
                ),
                ScrollIndicator(
                  scrollController: ScrollController(),
                  width: 30,
                  height: 5,
                  indicatorWidth: 20,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorManager.getLightGrey()),
                  indicatorDecoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
                ),
              ],
            )),
      ),
    );
  }
}
