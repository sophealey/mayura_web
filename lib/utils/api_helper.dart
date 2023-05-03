import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:mayura_web/base/base_api_response.dart';
import 'package:mayura_web/utils/error_helper.dart';
import 'package:mayura_web/utils/local_storage.dart';
class ApiHelper {
  var client = http.Client();
  // ignore: constant_identifier_names
  static const String accessToken = 'fad09d096f81e6afa8a87b4b3ce9fc43';
  static const String bearer = 'fad09d096f81e6afa8a87b4b3ce9fc43';


  Future<dynamic> fetchDataAuth(String endPoint, {counter = 0}) async {
    var clientL = RetryClient(http.Client(), retries: 2);
    String newUrl = endPoint;

    print('Get URL: $newUrl');
    print('bearer : ${LocalStorageController().getBearer()}');
    int timeout = 1000;
    try {
      var response = await clientL.get(
            Uri.parse(newUrl),
            headers: {'access-token': accessToken,'content-type': 'application/json', 'Authorization': 'Bearer ${LocalStorageController().getBearer()}'},
      )
          .timeout(Duration(seconds: timeout))
          .catchError((e) {
              printInfo(info: 'catchError ' + e.toString());
              printInfo(info: 'catchError ' + newUrl );
              var baseApiResponse = json.decode(json.encode(BaseApiResponse(statusCode: 0, success: false, message: 'Request Timeout')));
              return baseApiResponse;
          });
      printInfo(info: 'Response URL: $endPoint');
      var responseJson = _returnResponse(response);
      return responseJson;
    } on TimeoutException catch (e) {
      printInfo(info: 'Timeout Error: $e');
      var responseJson = json.decode(json.encode(ErrorHelper(message: "Timeout Error").toJson()));
      return responseJson;
    } on SocketException catch (e) {
      printInfo(info: 'Socket Error: $e');
    } on Error catch (e) {
      printInfo(info: 'General Error: $e');
      var baseApiResponse = json.decode(json.encode(BaseApiResponse(statusCode: 0, success: false, message: 'Request Timeout')));
      return baseApiResponse;
    } finally {
      clientL.close();
    }
  }

  dynamic _returnResponse(http.Response response) async {
    print('========================== Start ============================');
    print('Status Code : ${response.statusCode}');
    print('Status Code1 :  ${response.statusCode} : ${response.body}');
    print('=========================== End ========================');

    // print(
    //     '========================== Customer Log ============================');
    // var logResponse = http.post(Uri.parse(ApiEndPoint.customerLogs), headers: {
    //   'access-token': accessToken,
    // }, body: {
    //   "customer_id": "1",
    //   "action": "Test Customer Log"
    // });
    // print(logResponse);

    switch (response.statusCode) {
      case 200:
        printInfo(info: 'mariya a ${response.statusCode}');
        printInfo(info: 'mariya a ${response.headers.values}');
        printInfo(info: 'mariya a ${response.body}');
        var responseJson = json.decode(response.body);
        return responseJson;
      /* case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InternalExeception(response.body.toString());*/
      default:
        var responseJson = json.decode(json.encode(ErrorHelper(message: 'somethingWentWrong'.tr).toJson()));
        print(json.encode(ErrorHelper(message: 'somethingWentWrong'.tr).toJson()));
        return responseJson;
    }
  }
}
