import 'dart:async';

import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/base/base_api_response.dart';
import 'package:mayura_web/base/base_service.dart';

import '../../model/home_menu.dart';
import '../../model/home_model.dart';
import '../../network/api_end_point.dart';

class HomeService extends BaseService {
  Future<BaseApiResponse> fetchHomeMenu() async {
    response = await apiHelper.fetchDataAuth('${ApiEndPoint.homeMenu}language=en');
    return BaseApiResponse.fromListJson(
      response,
      (homeMneu) => List<HomeMenu>.from(
        homeMneu.map((data) => HomeMenu.fromJson(data)),
      ),
    );
  }

  Future<BaseApiResponse> getHomeData(int homeMenu) async {
    var response = await apiHelper.fetchDataAuth('${ApiEndPoint.homePage}home_menu_id=$homeMenu&language=en');
    return BaseApiResponse<HomeModel>.fromJson(response, (data) => HomeModel.fromJson(data));
  }
}
