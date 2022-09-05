import 'dart:convert';
import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:http/http.dart' as http;



class UsersProvider{
  String _url = Environment.API_DELIVERY;
  String _api = "/api/users";

  Future<ResponseApi>create(User user) async{

    ResponseApi responseApi = ResponseApi();
    try{

      Uri url = Uri.http(_url, '${_api}/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type':'application/json'
      };

      final res = await http.post(url,headers:headers,body: bodyParams);
      final data = json.decode(res.body);

      responseApi = ResponseApi.fromJson(data);

    }catch(e){
      responseApi = ResponseApi(
        success: false,
        data: null,
        error: '',
        message: e.toString()
      );
    }
    return responseApi;
  }

  Future<ResponseApi>login(String email, String password) async{
    ResponseApi responseApi = ResponseApi();
    try{

      Uri url = Uri.http(_url, '${_api}/login');
      String bodyParams = json.encode({
        'email':email,
        'password':password
      });
      Map<String, String> headers = {
        'Content-type':'application/json'
      };

      final res = await http.post(url,headers:headers,body: bodyParams);
      final data = json.decode(res.body);

      responseApi = ResponseApi.fromJson(data);

    }catch(e){
      responseApi = ResponseApi(
          success: false,
          data: null,
          error: '',
          message: e.toString()
      );
    }
    return responseApi;
  }
}