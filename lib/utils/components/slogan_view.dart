import 'package:flutter/material.dart';
import 'package:mayura_web/utils/colors_list.dart';

import '../color_manager.dart';
import '../text_styles.dart';

class SloganView extends StatelessWidget {
  const SloganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: ColorManager.getGrayBlack(),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SloganTile(
                icon: Icons.local_shipping_outlined,
                title: 'Free Shipping',
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                height: 1,
                color: ColorManager.getGrayBlack(),
              ),
              SloganTile(
                icon: Icons.security,
                title: 'Genuine Products',
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                height: 1,
                color: ColorManager.getGrayBlack(),
              ),
              SloganTile(
                icon: Icons.wifi_protected_setup,
                title: 'Free Returns',
              ),
            ],
          ),
        ));
  }
}

class SloganTile extends StatelessWidget {
  const SloganTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: menuTextStyle,
                ),
                Text(
                  'Description',
                  style: descriptionTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
