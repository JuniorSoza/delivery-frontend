// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  int id;
  String name;
  String image;
  String route;

  ResponseApi({
    required this.id,
    required this.name,
    required this.image,
    required this.route ,
  });

  @override
  String toString() {
    return 'ResponseApi{id: $id, name: $name, image: $image, route: $route}';
  }

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
  };
}