
import 'dart:async';

import 'package:mayura_web/model/product_model.dart';
import 'package:mayura_web/base/base_api_response.dart';
import 'package:mayura_web/base/base_service.dart';

class CatalogService extends BaseService {

  Future<BaseApiResponse> getProductsByCat({
    required List<int> keyIds,
    required bool isDropShipping,
    required bool isFbm,
    required bool isDiscount,
    required String priceFilter,
    required int page,
    required String keyword,
    required double minPrice,
    required double maxPrice,
    required List<int> categoryIds,
    List<int>? brandIds,
    required bool isInStock,
  }) async {
    // var customerId = 1;
    var dropShipping = isDropShipping ? 1 : 0;
    var discount = isDiscount ? 1 : 0;
    var fbm = isFbm ? 1 : 0;
    var inStock = isInStock ? 1 : 0;
    var url = '';
    var checkedId = keyIds.isEmpty ? '' : keyIds;
    var brandId = brandIds ?? [];
    url = 'http://gateway.mayura.com.kh/product/product-by-category?language=en&dropShipping=0&page=$page&categoryId=[69]&categoryIds=[]&brandIds=[]&isDiscount=0&sortFilter=popular&isFbm=0&isInStock=0&keyword=';

    var response = await apiHelper.fetchDataAuth(url);
    return BaseApiResponse<CatalogModel>.fromJson(response, (data) => CatalogModel.fromJson(data));
  }


}
