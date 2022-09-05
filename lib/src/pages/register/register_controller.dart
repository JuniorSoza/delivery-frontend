import 'package:flutter/material.dart';
import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../provider/users_provider.dart';

class RegisterController {

  BuildContext? context;
  TextEditingController emailController =  TextEditingController();
  TextEditingController nameController =  TextEditingController();
  TextEditingController lastnameController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmPasswordController =  TextEditingController();


  UsersProvider usersProvider =  new UsersProvider();

  Future? init(BuildContext context){
    this.context=context;
  }

  void gotoLoginPage(){
    Navigator.pushNamed(context! , 'login');
  }

  Future<ResponseApi> register() async {
    ResponseApi _responseApi = ResponseApi();
    try{
      String email =  emailController.text.trim();
      String name =  nameController.text;
      String lastname =  lastnameController.text;
      String phone =  phoneController.text.trim();
      String password =  passwordController.text.trim();
      String confirmPassword =  confirmPasswordController.text.trim();

      if (email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty){
        _responseApi = ResponseApi(success: false,message: 'Debe ingresar todo los campos..!',error: '',data: null);
        return _responseApi;
      }

      if(password != confirmPassword){
        _responseApi = ResponseApi(success: false,message: 'Las contraseñas no coinciden..!',error: '',data: null);
        return _responseApi;
      }

      if(password.length < 6){
        _responseApi = ResponseApi(success: false,message: 'La contraseña debe tener al menos 6 caracteres..!',error: '',data: null);
        return _responseApi;
      }

      User user = User(
          email: email,
          name: name,
          lastname: lastname,
          phone: phone,
          image: "qq",
          password: password,
          is_available: true,
          session_token: "kk"
      );

      _responseApi = await usersProvider.create(user);
      return _responseApi;
    }catch(e){
      _responseApi = ResponseApi(success: false,message: e.toString(),error: '',data: null);
      return _responseApi;
    }

  }


}