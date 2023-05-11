import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/home/components/popular_brand.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/product_tile.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/components/my_faded_image.dart';
import '../../../utils/responsive_widget.dart';
import '../../../utils/text_styles.dart';

class BestSelling extends GetView<HomeController> {
  const BestSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Best Selling'.toUpperCase(),
                  style: menuTextStyle,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ViewAllBox(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          // height: (controller.bestSelling.length).isGreaterThan(3) ? 330 : 150,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() => AlignedGridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.bestSelling.length >= 4 ? 4 : controller.bestSelling.length,
                crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 2 : 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return ProductTile(controller.bestSelling[index], () {});
                },
              )),
        ),
      ],
    );
  }
}
