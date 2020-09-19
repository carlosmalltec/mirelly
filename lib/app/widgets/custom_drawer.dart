import 'package:flutter/material.dart';
import 'package:sistema_de_controle/app/widgets/page_session.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: [
              PageSession(),
            ],
          ),
        ),
      ),
    );
  }
}


