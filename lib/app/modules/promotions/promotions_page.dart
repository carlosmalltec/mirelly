import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'promotions_controller.dart';

class PromotionsPage extends StatefulWidget {
  final String title;
  const PromotionsPage({Key key, this.title = "Promotions"}) : super(key: key);

  @override
  _PromotionsPageState createState() => _PromotionsPageState();
}

class _PromotionsPageState
    extends ModularState<PromotionsPage, PromotionsController> {
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
