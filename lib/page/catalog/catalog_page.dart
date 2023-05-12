

import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mayura_web/page/catalog/catalog_controller.dart';
import 'package:mayura_web/page/home/components/account_view.dart';
import 'package:mayura_web/product_detail/product_detail_screen.dart';
import 'package:mayura_web/utils/StringConstant.dart';
import 'package:mayura_web/utils/colors_list.dart';
import 'package:mayura_web/utils/components/category_component.dart';
import 'package:mayura_web/utils/components/top_bar_view.dart';
import 'package:mayura_web/utils/labeled_checkbox.dart';
import 'package:mayura_web/utils/product_tile.dart';
import 'package:mayura_web/utils/color_manager.dart';
import 'package:mayura_web/utils/responsive_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatalogPage extends GetView<CatalogController> {
 //// final controller = Get.find<CatalogController>();
  CatalogPage({Key? key, required List<int> cateId}) : super(key: key){
    controller.productList.value.clear();
    controller.cateId.value = cateId;
    controller.getProducts();

  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(40, 80);
    var screenSize = MediaQuery.of(context).size;
    printInfo(info: 'Screen :${MediaQuery.of(context).size.width}');
    return Theme(
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
        body: SmartRefresher(
          //  onRefresh: controller.onRefresh,
          controller: controller.refreshController,
          scrollController: controller.scrollController,
          enablePullDown: true,
          header: WaterDropMaterialHeader(
            backgroundColor: ColorManager.getPurpleLightPurple(),
          ),
          child:SingleChildScrollView(
            // controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: ResponsiveWidget.isSmallScreen(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton.icon(     // <-- TextButton
                              onPressed: () {
                                controller.isShowFilter.value = true;
                                printInfo(info: 'open ${controller.isShowFilter.value}');
                              },
                              icon: const Icon(
                                Icons.filter_list_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              label: Text(kFilterProducts.tr, style: TextStyle(color: Colors.black),),
                            ),


                            SizedBox(height:  20,),

                            Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            SizedBox(height:  20,),
                          ],
                        ),),

                      Center(
                        child: Container(
                         // width: 1140,
                          width: 1240,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Visibility(
                                visible: !ResponsiveWidget.isSmallScreen(context),
                                child: Expanded(
                                    flex: 2,
                                    child: Card(
                                      elevation: 4,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                                                child: Text('Price Range')
                                            ),
                                            SizedBox(height:  20,),
                                            Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),

                                            SizedBox(height:  14,),

                                            RangeSlider(
                                              values: _currentRangeValues,
                                              max: 100,
                                              divisions: 5,
                                              labels: RangeLabels(
                                                _currentRangeValues.start.round().toString(),
                                                _currentRangeValues.end.round().toString(),
                                              ),
                                              onChanged: (RangeValues values) {
                                                _currentRangeValues = values;

                                              },
                                            ),

                                            ListView.builder(
                                              itemExtent: 30,
                                              itemCount: controller.specialFilter.length,
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (BuildContext context, int index) {
                                                return Obx(
                                                      () {
                                                    return LabeledCheckbox(
                                                      label: controller.specialFilter[index].name,
                                                      value: controller.specialFilter[index].isChecked.value,
                                                      onChanged: (bool value) {
                                                        controller.specialFilter[index].isChecked.value = value;
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(height:  20,),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                                                child: Text('Filter by Categories')
                                            ),
                                            SizedBox(height:  20,),
                                            Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height:  14,),
                                            ListView.builder(
                                              itemExtent: 30,
                                              itemCount: controller.categoryList.length,
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (BuildContext context, int index) {
                                                return Obx(
                                                      () {
                                                    return LabeledCheckbox(
                                                      label: controller.categoryList[index].name,
                                                      value: controller.categoryList[index].isChecked.value,
                                                      onChanged: (bool value) {
                                                        controller.categoryList[index].isChecked.value = value;
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(height:  20,),
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                                                child: Text('Filter By Brand')
                                            ),
                                            SizedBox(height:  20,),
                                            Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height:  14,),
                                            ListView.builder(
                                              itemExtent: 30,
                                              itemCount: controller.brandList.length,
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (BuildContext context, int index) {
                                                return Obx(
                                                      () {
                                                    return LabeledCheckbox(
                                                      label: controller.brandList[index].name,
                                                      value: controller.brandList[index].isChecked.value,
                                                      onChanged: (bool value) {
                                                        controller.brandList[index].isChecked.value = value;
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),),

                              SizedBox(width: 20),

                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    Obx(() => AlignedGridView.count(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount:  controller.productList.value.length,
                                      crossAxisCount:  ResponsiveWidget.isSmallScreen(context) ? 2: 4,
                                      mainAxisSpacing: 14,
                                      crossAxisSpacing: 14,
                                      itemBuilder: (context, index) {
                                        return ProductTile(
                                            controller.productList[index], (){
                                              Get.to(ProductDetailScreen(proId: controller.productList[index].id.toString(), cateName: controller.cateId.toString(),), routeName: 'product/${controller.productList[index].name??0}');
                                        }
                                        );
                                      },
                                    )),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    /*Container(
                                      width: 500,
                                      height: 30,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                              margin: EdgeInsets.only(left: 4, right: 4),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1, color: ColorManager.getBlackWhite(),),
                                                borderRadius: BorderRadius.all(
                                                      Radius.circular(4),
                                                    ),
                                              ),
                                              child: Text('1')),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              controller.page.value = 2;
                                              controller.getProducts();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                              margin: EdgeInsets.only(left: 4, right: 4),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1, color: ColorManager.getBlackWhite(),),
                                                borderRadius: BorderRadius.all(
                                                      Radius.circular(4),
                                                    ),
                                              ),
                                              child: Text('2')),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                            margin: EdgeInsets.only(left: 4, right: 4),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1, color: ColorManager.getBlackWhite(),),
                                              borderRadius: BorderRadius.all(
                                                    Radius.circular(4),
                                                  ),
                                            ),
                                            child: Text('3')),

                                        ],
                                      ),
                                    ),*/
                                  ],
                                ),),

                            ],
                          ),
                        ),
                      ),

                    ],

                  ),

                  Obx(() =>
                      Visibility(
                          visible: controller.isShowFilter.value ,
                          child:  Container(
                            color: Colors.black.withOpacity(0.7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                //height: 200,
                                width: MediaQuery.of(context).size.width/1.5,
                                child: FilterData(controller),
                              ),
                            ),
                          ))
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
class ViewFilterSmallScreen extends StatelessWidget {
  const ViewFilterSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: MediaQuery.of(context).size.width/1.5,
      color: Colors.red,
      child: Text('sadf'),
    );
  }
}

class FilterData extends GetView<CatalogController> {
 // late var controller ;
  FilterData(CatalogController controller, {Key? key}) : super(key: key){
  //  this.controller = controller ;
  }

  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(40, 80);
    return Card(
     // elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter Options'
                    ''),
                InkWell(
                  onTap: (){
                    controller.isShowFilter.value = false;
                    printInfo(info: 'close ${controller.isShowFilter.value}');
                  },
                    child: Icon(Icons.close, size: 24,))
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Text('Price Range')
            ),
            SizedBox(height:  20,),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),

            SizedBox(height:  14,),

            RangeSlider(
              values: _currentRangeValues,
              max: 100,
              divisions: 5,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                _currentRangeValues = values;

              },
            ),

            ListView.builder(
              itemExtent: 30,
              itemCount: controller.specialFilter.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                      () {
                    return LabeledCheckbox(
                      label: controller.specialFilter[index].name,
                      value: controller.specialFilter[index].isChecked.value,
                      onChanged: (bool value) {
                        controller.specialFilter[index].isChecked.value = value;
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height:  20,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Obx(() => Text('Filter by Categories ${controller.brandList.length}'),)
            ),
            SizedBox(height:  20,),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height:  14,),
            Obx(() => ListView.builder(
              itemExtent: 30,
              itemCount: controller.categoryList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                      () {
                    return LabeledCheckbox(
                      label: controller.categoryList[index].name,
                      value: controller.categoryList[index].isChecked.value,
                      onChanged: (bool value) {
                        controller.categoryList[index].isChecked.value = value;
                      },
                    );
                  },
                );
              },
            ),),

            SizedBox(height:  20,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Text('Filter By Brand')
            ),
            SizedBox(height:  20,),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height:  14,),
            ListView.builder(
              itemExtent: 30,
              itemCount: controller.brandList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                      () {
                    return LabeledCheckbox(
                      label: controller.brandList[index].name,
                      value: controller.brandList[index].isChecked.value,
                      onChanged: (bool value) {
                        controller.brandList[index].isChecked.value = value;
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

