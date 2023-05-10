import 'package:flutter/material.dart';
import 'package:mayura_web/utils/text_styles.dart';

import '../color_manager.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorManager.getGrayBlack()),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: ColorManager.getGrayBlack(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.menu),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'All Categories',
                    style: menuTextStyle,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryMenuTile(
                  icon: Icons.phone_android,
                  title: 'Cell Phones',
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  // indent: 15,
                  // endIndent: 15,
                  height: 1,
                  color: ColorManager.getGrayBlack(),
                );
              },
              itemCount: 10),
        ],
      ),
    );
  }
}

class CategoryMenuTile extends StatelessWidget {
  const CategoryMenuTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // decoration: BoxDecoration(border: Border.all(width: 1, color: ColorManager.getGrayBlack())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: menuTextStyle,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: ColorManager.getLightGrey(),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
