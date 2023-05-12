import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mayura_web/model/product_detail_model.dart';
import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/page/home/components/account_view.dart';
import 'package:mayura_web/product_detail/product_detail_controller.dart';
import 'package:mayura_web/utils/StringConstant.dart';
import 'package:mayura_web/utils/color_manager.dart';
import 'package:mayura_web/utils/colors_list.dart';
import 'package:mayura_web/utils/components/category_component.dart';
import 'package:mayura_web/utils/components/top_bar_view.dart';
import 'package:mayura_web/utils/responsive_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  //GetView<ProductDetailController>
  final controller = Get.find<ProductDetailController>();
  ProductDetailScreen({Key? key, required String proId, String cateName = ''}) : super(key: key) {
    print('kk99 $proId');
    controller.proId.value = proId;
    controller.cateName.value = cateName;
    controller.imgPath.value = '';
    controller.heroTag = '';
    controller.qty.value = 1;
    controller.isQtyNotAvailable.value = false;
    controller.getProDetail();
    // controller.viewProduct();
  }

  final _formKey = GlobalKey<FormState>();
  final buttonCarouselController = CarouselController();
  Widget getDescription(String des) {
    Widget html = Html(
      data: des,
      // style: {"body": Style(lineHeight: LineHeight.number(1.2))},
    );
    return html;
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // controller.addKeyboardListener(context);
    RangeValues _currentRangeValues = const RangeValues(40, 80);
    var screenSize = MediaQuery.of(context).size;
    return  Theme(
        data: Theme.of(context),
        child: Scaffold(
            appBar: ResponsiveWidget.isSmallScreen(context)
                ? AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                'Mayura',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                InkWell(
                  onTap: () {
                    _key.currentState?.openEndDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.person),
                  ),
                ),
              ],
            )
                : PreferredSize(
              preferredSize: Size(screenSize.width, 150),
              child: Column(
                children: [
                  const MyAccountView(),
                  const TopBarContent(),
                ],
              ),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  CategoryComponent(),
                ],
              ),
            ),
            endDrawer: Drawer(
              backgroundColor: Colors.white,
              child: AccountView(),
            ),
         body: SingleChildScrollView(
           child: Align(
             alignment: Alignment.center,
             child: Obx(() => Container(
                 width: controller.isLoading.value ? 40:  1240,
                 child: Obx(() => controller.isLoading.value ? CircularProgressIndicator(color: kPrimaryColor) : Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 20,
                     ),
                     Text('Home / ${controller.cateName.value} / ${controller.productDetail.value.name}'),
                     SizedBox(
                       height: 10,
                     ),

                     ResponsiveWidget.isSmallScreen(context) ?
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(
                           height: 10,
                         ),
                         Obx(() => ImageSection(controller.productDetail.value)),
                         Container(
                           margin: EdgeInsets.all(14),
                           color: Colors.white,
                           child: Obx(() => DetailSection(controller.productDetail.value)),
                         )
                       ],

                     ): Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Expanded(flex: 1 , child: Obx(() => ImageSection(controller.productDetail.value)),),
                         SizedBox(width: 40,),
                         Expanded(
                             flex: 2,
                             child: DetailSection(controller.productDetail.value))



                       ],
                     ),

                     Row(
                       children: [

                         Text(reviewed.tr),
                       ],
                     )


                   ],
                 ),)
             ),)
           ),

          )
        ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final ProductDetail product;
  const ImageSection(this.product, );
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all( 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
            ),

          child: Image.network(
            product.thumbnail??'',
            fit: BoxFit.contain,
            width: screenSize.width/(ResponsiveWidget.isSmallScreen(context) ? 1: 3 ),
          ),
        ),



        Container(
          height: 150,
          margin: EdgeInsets.only(top: 20),
          child:  ListView.builder(
            itemCount: product.image?.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return  Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                margin: EdgeInsets.only(right: 4),
                child: Image.network(
                  product.image?[index].path??'',
                  fit: BoxFit.contain,

                ),
              );
            },
          ),
        )






      ],
    );
  }
}
class DetailSection extends StatelessWidget {
  final ProductDetail product;
  const DetailSection(this.product, );
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(product.name??'', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(product.priceFormat??'', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: Colors.red),),
              SizedBox(
                width: 30,
              ),
              Text(product.finalPrice??'', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30, color: Colors.grey, decoration: TextDecoration.lineThrough,),),

            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(product.isInstock ? kInStock.tr : outofStockmsg1.tr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.green),),
          SizedBox(
            height: 20,
          ),

          Container(
            color: ColorManager.getWhiteDark(),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: kPrimaryColor,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 80,
                  alignment: Alignment.center,
                  child: TextFormField(
                    // focusNode: controller.numberFocusNode,
                    style: TextStyle(color: ColorManager.getPurpleWhite()),
                    controller: TextEditingController(text: '1'),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {

                    },
                    decoration: InputDecoration(
                      hintText: '1',
                      labelStyle: TextStyle(
                        color: ColorManager.getPurpleWhite(),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorManager.getPurpleLightPurple(),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                          width: 0.4,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if ((product.quantity ?? 0) > 0) {
                      // controller.addQty();
                    }
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: kPrimaryColor,
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
                SizedBox(width: 20,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,

                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    addToCart.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.2, color: Colors.white, fontSize:18),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(kDescription.tr , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(
            height: 10,
          ),

          Html(data: product.description),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  product.shop?.logo??'',
                  fit: BoxFit.contain,
                  width: 100,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.shop?.name??'', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: kPrimaryColor),
                            ),
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            following.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(height: 1.2, color: Colors.white, fontSize:18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: kPrimaryColor),
                            ),
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            shop.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.2, color: Colors.white, fontSize:18),
                          ),
                        ),
                      ],
                    )

                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}

