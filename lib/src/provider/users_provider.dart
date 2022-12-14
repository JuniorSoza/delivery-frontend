import 'dart:convert';
import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class UsersProvider{
  String _url = Environment.API_DELIVERY;
  String _api = "/api/users";

  Future? init(BuildContext context){
    this.context = context;
  }

  Future<ResponseApi>create(User user) async{

    try{

      Uri url = Uri.http(_url, '${_api}/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type':'application/json'
      };
      final res = await http.post(url,headers:headers,body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi  responseApi = ResponseApi.fromJson(data);
      return responseApi;

    }catch(e){
      print('Error: ${e}');
      return null;
    }

  }
}