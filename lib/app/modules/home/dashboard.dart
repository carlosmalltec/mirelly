import 'package:flutter/material.dart';
import 'package:sistema_de_controle/app/widgets/custom_drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
    );
  }
}
