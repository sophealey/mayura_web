

class BaseApiResponse<T> {
  int? statusCode;
  bool? success;
  String? message;
  T? data;
  List<T>? listObject;
  List<dynamic>? emptyListData;

  BaseApiResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    this.data,
    this.listObject,
    this.emptyListData,
  });

  factory BaseApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseApiResponse<T>(
        statusCode: json["status_code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? create(json["data"]) : json["data"]);
  }

  factory BaseApiResponse.fromListJson(
      Map<String, dynamic> json, Function(List<dynamic>) listObject) {
    return BaseApiResponse<T>(
        statusCode: json["status_code"],
        success: json["success"],
        message: json["message"],
        listObject: json["data"] != null ? listObject(json["data"]) : []);
  }
  factory BaseApiResponse.fromEmptyList(
      Map<String, dynamic> json, List<dynamic> listObject) {
    return BaseApiResponse<T>(
        statusCode: json["status_code"],
        success: json["success"],
        message: json["message"],
        emptyListData: json["data"] ?? []);
  }

  factory BaseApiResponse.fromSubmitJson(Map<String, dynamic> json) {
    return BaseApiResponse<T>(
      statusCode: json["status_code"],
      success: json["success"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'success': success,
        'message': message,
        'data': data
      };
}
