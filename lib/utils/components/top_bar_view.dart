import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../colors_list.dart';
import '../responsive_widget.dart';
import '../text_styles.dart';

class TopBarContent extends StatelessWidget {
  const TopBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.white.withOpacity(0.5),
      width: 1140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'images/mayura_horizontal_logo.png',
            width: 150,
            height: 80,
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search Mayura...',
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SizedBox(
          //   width: screenSize.width / 15,
          // ),
          // const TextMenu(
          //   title: 'Home',
          // ),
          // SizedBox(
          //   width: screenSize.width / 15,
          // ),
          // const TextMenu(
          //   title: 'Coperate',
          // ),
          // SizedBox(
          //   width: screenSize.width / 15,
          // ),
          // const TextMenu(
          //   title: 'Contact',
          // ),
          // SizedBox(
          //   width: screenSize.width / 15,
          // ),
          // const TextMenu(
          //   title: 'About',
          // ),

          SizedBox(
            width: 30,
          ),
          // Icon(Icons.shopping_cart),
          // Text(
          //   'Cart',
          //   style: menuTextStyle,
          // ),
          Icon(
            Icons.perm_identity,
            size: 35,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In'),
              Text(
                'Account',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 35,
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            Icons.favorite_border,
            size: 35,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total:'),
              Text(
                '\$0.00',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1140,
      padding: EdgeInsets.all(10),
      // height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Account'),
          SizedBox(
            width: 15,
          ),
          Text('Wishlist'),
          SizedBox(
            width: 15,
          ),
          Text('Address'),
          SizedBox(
            width: 15,
          ),
          Text('About Us'),
          Flexible(
            child: Container(),
          ),
          Text('My Order'),
          SizedBox(
            width: 15,
          ),
          Text('Language'),
          SizedBox(
            width: 15,
          ),
          Text('Policies'),
        ],
      ),
    );
  }
}
