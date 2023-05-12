import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayura_web/page/home/home_controller.dart';
import 'package:mayura_web/utils/color_manager.dart';

import '../../../utils/responsive_widget.dart';
import '../../../utils/text_styles.dart';

class PopularBrand extends GetView<HomeController> {
  const PopularBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Popular Brans'.toUpperCase(),
                  style: menuTextStyle,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ViewAllBox(),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: Obx(
              () => ListView.builder(
                  // controller: brandScroller,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.brandModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    var brand = controller.brandModel[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              child: Image.network(
                                brand.icon ?? '',
                                fit: BoxFit.contain,
                                width: 130,
                                height: 70,
                                // isCache: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewAllBox extends StatelessWidget {
  const ViewAllBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'View All',
              style: TextStyle(fontSize: 14, color: ColorManager.getPurpleWhite()),
            ),
            WidgetSpan(
              child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: ColorManager.getPurpleWhite()),
            ),
          ],
        ),
      ),
    );
  }
}
