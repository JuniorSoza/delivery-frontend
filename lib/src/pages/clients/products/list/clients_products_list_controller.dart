import 'package:delivery/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class ClientsProductsListController{

  BuildContext? context;
  SharedPrefs _sharedPrefs = SharedPrefs();

  Future? init(BuildContext context){
    this.context = context;
  }

  logout(){
    _sharedPrefs.logout(context!);
  }

}