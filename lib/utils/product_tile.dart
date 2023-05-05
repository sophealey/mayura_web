import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/utils/color_manager.dart';
import 'package:mayura_web/utils/colors_list.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, this.onPress);
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.thumbnail??'',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 1,right: 1,
                      child: Image.asset('images/heart.png', width: 24, height: 24,)
                  ),
                  Positioned(
                    top: 1,
                    child: Visibility(
                      visible: product.isShowDisount ?? false,
                      child: Card(
                        margin: const EdgeInsets.only(right: 5, top: 5),
                        color: Colors.red,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                            child: Text(
                              //'${themeController.getLanguage() != 'en' ? '-' : ''}${product?.discount.toString()}%${themeController.getLanguage() == 'en' ? ' OFF' : ''}',
                              '${product.discount.toString()}%',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],


              ),
              const SizedBox(height: 8),
              Text(
                product.brand??'',
                maxLines: 2,
                style:
                    const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                product.name??'',
                maxLines: 2,
                style:
                    const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                unratedColor: kBackGroundColor,
                itemSize: 20,
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  printInfo(info: rating.toString());

                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${product.price}',
                          style: TextStyle(fontSize: 18, color: ColorManager.getPurpleLightPurple() )),
                      Text('${product.priceFormat}',
                        style: const TextStyle(fontSize: 16, color: Colors.grey,
                          decoration: TextDecoration.lineThrough, ),),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 18,
                      color: ColorManager.getPurpleLightPurple(),
                    ),
                  ),

                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
