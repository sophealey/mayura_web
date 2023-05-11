import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/components/my_faded_image.dart';
import 'package:mayura_web/utils/text_styles.dart';

import 'package:get/get.dart';

import '../../../utils/responsive_widget.dart';

class PopularCategoryView extends GetView<HomeController> {
  const PopularCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Popular Cateogry'.toUpperCase(),
            style: menuTextStyle,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: double.infinity,
          height: ResponsiveWidget.isSmallScreen(context) ? 250 : 290,
          child: Obx(
            () => AlignedGridView.count(
                // controller: scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: controller.popularCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  var popularCat = controller.popularCategories[index];
                  print('size ${Get.width / 8}');
                  return InkWell(
                    onTap: () {
                      Get.to(CatalogPage(
                        cateId: [popularCat.id ?? 0],
                      ));
                    },
                    child: SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context) ? 100 : 160,
                      child: Column(
                        children: [
                          ClipOval(
                            child: MyFadedImage(
                              imageUrl: popularCat.icon ?? '',
                              width: ResponsiveWidget.isSmallScreen(context) ? 80 : 100,
                              height: ResponsiveWidget.isSmallScreen(context) ? 80 : 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              popularCat.name ?? '',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(height: 1.1, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
