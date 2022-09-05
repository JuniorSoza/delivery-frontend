import 'package:delivery/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';
//hola como estas
//ashdgadad
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login':(BuildContext context)=>LoginPage()
      },
    );
  }
}
