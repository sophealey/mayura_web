import 'package:flutter/material.dart';
import 'package:mayura_web/utils/color_manager.dart';
import 'package:mayura_web/utils/colors_list.dart';
import 'package:mayura_web/utils/text_styles.dart';

import '../../../utils/components/category_component.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                Icons.account_circle,
                color: kPrimaryColor,
                size: 40,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sophealey'),
                  const SizedBox(height: 3),
                  Text('(+855) 96-488-3800)'),
                  const SizedBox(height: 3),
                  Text(
                    'Sell on Mayura',
                    style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Flexible(child: Container()),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorManager.getGrayBlack(),
              ),
            ],
          ),
        ),
        Divider(
          indent: 15,
          endIndent: 15,
          height: 1,
          color: ColorManager.getGrayBlack(),
        ),
        CategoryMenuTile(
          icon: Icons.favorite_border,
          title: 'Wishlist',
        ),
        CategoryMenuTile(
          icon: Icons.history,
          title: 'Recently Viewed',
        ),
        CategoryMenuTile(
          icon: Icons.credit_card,
          title: 'Coupons',
        ),
        CategoryMenuTile(
          icon: Icons.storefront,
          title: 'Following',
        ),
        CategoryMenuTile(
          icon: Icons.shopping_bag_outlined,
          title: 'My Order',
        ),
        CategoryMenuTile(
          icon: Icons.pin_drop_outlined,
          title: 'Address',
        ),
        Divider(
          indent: 15,
          endIndent: 15,
          height: 1,
          color: ColorManager.getGrayBlack(),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Preference',
            style: menuTextStyle,
          ),
        ),
        CategoryMenuTile(
          icon: Icons.language,
          title: 'language',
        ),
        CategoryMenuTile(
          icon: Icons.dark_mode_outlined,
          title: 'Dark Mode',
        ),
        CategoryMenuTile(
          icon: Icons.person_add_alt,
          title: 'Follow Us',
        ),
        Divider(
          indent: 15,
          endIndent: 15,
          height: 1,
          color: ColorManager.getGrayBlack(),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Let Us Help You',
            style: menuTextStyle,
          ),
        ),
        CategoryMenuTile(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy Policy',
        ),
        CategoryMenuTile(
          icon: Icons.book_outlined,
          title: 'Conditions of Use',
        ),
        CategoryMenuTile(
          icon: Icons.local_shipping_outlined,
          title: 'Shipping And Delivery Policies',
        ),
        CategoryMenuTile(
          icon: Icons.assignment_return_outlined,
          title: 'Return, Refund, Cancellation Policies',
        ),
        CategoryMenuTile(
          icon: Icons.contact_phone_outlined,
          title: 'Contact Us',
        ),
      ],
    );
  }
}
