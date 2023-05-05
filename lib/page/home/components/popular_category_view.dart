import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_page.dart';
import 'package:mayura_web/utils/text_styles.dart';

import 'package:get/get.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Popular Cateogry',
            style: menuTextStyle,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 210,
          child: GridView.builder(
              // controller: scrollController,
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(CatalogPage());
                  },
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'http://gateway.mayura.com.kh/storage/category/icon/27086520230414094319.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Skin Care',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(height: 1.1, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
