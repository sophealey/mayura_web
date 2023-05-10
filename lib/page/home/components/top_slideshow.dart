import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/home/home_controller.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/responsive_widget.dart';
import 'package:get/get.dart';

class TopSlideShow extends GetView<HomeController> {
  const TopSlideShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      color: ColorManager.getWhiteDark(),
      child: Obx(
        () => Visibility(
          visible: controller.headerSlide.isNotEmpty,
          child: Obx(
            () => CarouselSlider.builder(
              itemCount: controller.headerSlide.length,
              itemBuilder: (context, index, page) {
                return InkWell(
                  onTap: () {},
                  child: Image.network(
                    controller.headerSlide[index].photo ?? '', //'http://gateway.mayura.com.kh/storage/banner/99600820230428085719.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                );
              },
              // carouselController: buttonCarouselController,
              options: CarouselOptions(
                  height: ResponsiveWidget.isSmallScreen(context) ? 300 : 378,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    // controller.currentPage.value = index;
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
