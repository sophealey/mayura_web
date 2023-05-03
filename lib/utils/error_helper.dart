class ErrorHelper{
  bool success;
  String message;
  dynamic data;

  ErrorHelper({this.success = false,required this.message,this.data});

  factory ErrorHelper.fromJson(Map<String, dynamic> json) => ErrorHelper(
    success: json["success"],
    message: json["message"],
    data: json["data"],
  );

  Map<String,dynamic> toJson() =>{
    'success':success,
    'message':message,
    'data':data
  };
}