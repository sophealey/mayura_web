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

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  final mainMenu = [
    'BEAUTY & HEALTH',
    'TOYS, KINS & BABY',
    'ELECTRONIC',
    'FASHION',
    // 'New',
    // 'Make up',
    // 'Skin Care',
    // 'Hair',
    // 'Bath and Accessory',
    // 'Baby Care',
    // 'Electronic',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          // decoration: BoxDecoration(
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(5),
          //   ),
          //   color: Colors.white,
          //   boxShadow: [
          //     BoxShadow(
          //       offset: const Offset(0, 1),
          //       blurRadius: 5,
          //       color: Colors.black.withOpacity(0.1), // Shadow position
          //     ),
          //   ],
          // ),
          margin: EdgeInsets.only(left: 10),
          height: 60,
          child: ListView.builder(
            itemCount: mainMenu.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextMenu(
                  title: mainMenu[index],
                  color: index == 0 ? kPrimaryColor : Colors.black54,
                ),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 1,
          color: ColorManager.getGrayBlack(),
          width: double.infinity,
        ),
        SizedBox(
          height: 20,
        ),
        Container(width: double.infinity, child: TopSlideShow()),
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

class TopSlideShow extends StatelessWidget {
  const TopSlideShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      color: ColorManager.getWhiteDark(),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, page) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              'http://gateway.mayura.com.kh/storage/banner/99600820230428085719.jpg',
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
    );
  }
}
