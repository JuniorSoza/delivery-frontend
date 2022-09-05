import 'dart:convert';
//https://app.quicktype.io/
ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {

  String message = '';
  String error = '';
  bool success = false;
  dynamic? data;


  ResponseApi({
    this.success = false,
    this.message = '',
    this.error = '',
    this.data
  });


  factory ResponseApi.fromJson(Map<String, dynamic> json)=>ResponseApi(
    success: json["success"],
    message: json["message"],
    error: json["error"],
    data: json["data"],
  );

  @override
  String toString() {
    return 'ResponseApi{message: $message, error: $error, success: $success, data: $data}';
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "error": error,
    "data":data
  };
}
