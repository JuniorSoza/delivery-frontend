import 'package:delivery/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../provider/users_provider.dart';

class LoginController {

  BuildContext? context;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  UsersProvider usersProvider =  UsersProvider();
  SharedPrefs _sharedPrefs = SharedPrefs();

  Future? init(BuildContext context) async {
    this.context=context;
    //await usersProvider.init(context);
    User user = User.fromJson(await _sharedPrefs.read('user') ?? {});
    print('usuario logeado ${ user.toString()}');
    if (user.session_token != null){
      Navigator.pushNamedAndRemoveUntil(context, 'clients/products/list', (route) => false);
    }
  }

  void gotoRegisterPage(){
    Navigator.pushNamed(context! , 'register');
  }

  Future<ResponseApi> login() async{
    ResponseApi _responseApi = ResponseApi();
    try{
      String Email = EmailController.text.trim();
      String Password = PasswordController.text.trim();

      if (Email.isEmpty || Password.isEmpty){
        _responseApi = ResponseApi(success: false,message: 'Debe ingresar el email y la contraseña..!',error: '',data: null);
        return _responseApi;
      }
      _responseApi = await usersProvider.login(Email,Password);
      if (_responseApi.success){
        User user = User.fromJson(_responseApi.data);
        _sharedPrefs.save('user', user.toJson());
        Navigator.pushNamedAndRemoveUntil(context!, 'clients/products/list', (route) => false);
      }

      return _responseApi;
    }catch(e){
      _responseApi = ResponseApi(success: false,message: e.toString(),error: '',data: null);
      return _responseApi;
    }

  }

}
