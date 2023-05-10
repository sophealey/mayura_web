

import 'package:mayura_web/base/base_service.dart';
import 'package:mayura_web/model/product_detail_model.dart';
import 'package:mayura_web/network/api_end_point.dart';

import '../../base/base_api_response.dart';

class ProductDetailService extends BaseService {
  Future<BaseApiResponse> getProductDetailById(String id) async {
    response = await apiHelper.fetchDataAuth('http://gateway.mayura.com.kh/product/product-detail?language=en&productId=$id&language=en');
    return BaseApiResponse<ProductDetail>.fromJson(
        response, (data) => ProductDetail.fromJson(data));
  }
}
