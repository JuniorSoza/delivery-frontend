import 'package:delivery/src/pages/clients/products/list/clients_products_list_page.dart';
import 'package:delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:delivery/src/pages/login/login_page.dart';
import 'package:delivery/src/pages/register/register_page.dart';
import 'package:delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:delivery/src/pages/roles/roles_page.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery,App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login':(BuildContext context) => const LoginPage(),
        'register':(BuildContext context) => const RegisterPage(),
        'roles':(BuildContext context) => const RolesPage(),
        'clients/products/list':(BuildContext context) => const ClientsProductsListPage(),
        'delivery/orders/list':(BuildContext context) => const DeliveryOrdersListPage(),
        'restaurant/orders/list':(BuildContext context) => const RestaurantOrdersListPage()
      },

      theme: ThemeData(
        //fontFamily: 'NimbusSans',
        primaryColor: MyColors.primaryColor,

      ),
    );
  }
}
