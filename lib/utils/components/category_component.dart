import 'package:flutter/material.dart';
import 'package:mayura_web/utils/text_styles.dart';

import '../color_manager.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
        CategoryMenuTile(
          icon: Icons.phone_android,
          title: 'Cell Phones',
        ),
      ],
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
      decoration: BoxDecoration(border: Border.all(width: 1, color: ColorManager.getGrayBlack())),
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
              'Cell Phone',
              style: menuTextStyle,
            ),
          ),
          Icon(Icons.keyboard_arrow_right),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
