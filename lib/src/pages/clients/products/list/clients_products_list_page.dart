import 'package:delivery/src/pages/clients/products/list/clients_products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientsProductsListPage extends StatefulWidget {
  const ClientsProductsListPage({Key? key}) : super(key: key);

  @override
  State<ClientsProductsListPage> createState() => _ClientsProductsListPageState();
}

class _ClientsProductsListPageState extends State<ClientsProductsListPage> {

  ClientsProductsListController _con = ClientsProductsListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp){
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('cerrar sesion'),
          onPressed: _con.logout(),
        ),
      ),
    );
  }
}
