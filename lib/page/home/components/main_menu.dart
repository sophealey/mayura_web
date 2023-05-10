import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/home/home_controller.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/colors_list.dart';

class MainMenu extends GetView<HomeController> {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 1140,
          margin: EdgeInsets.only(left: 10),
          height: 60,
          child: Obx(
            () => ListView.builder(
              itemCount: controller.homeMenus.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextMenu(
                    title: controller.homeMenus[index].name ?? '',
                    color: index == 0 ? kPrimaryColor : Colors.black54,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 1,
          color: ColorManager.getGrayBlack(),
          width: double.infinity,
        ),
      ],
    );
  }
}

class TextMenu extends StatelessWidget {
  const TextMenu({Key? key, required this.title, this.color = Colors.black54}) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
