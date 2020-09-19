import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'sales_controller.dart';

class SalesPage extends StatefulWidget {
  final String title;
  const SalesPage({Key key, this.title = "Sales"}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends ModularState<SalesPage, SalesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.background,
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
