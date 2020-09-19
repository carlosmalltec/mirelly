import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_de_controle/app/app_controller.dart';
import 'package:sistema_de_controle/app/modules/home/controller_page_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppController appController = GetIt.I<AppController>();
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 95.0,
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
            size: 35.0,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                appController.isLoggedIn
                    ? GetIt.I<ControllerPageStore>().setPage(0)
                    : Modular.to.pushNamed('/login');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appController.isLoggedIn
                        ? appController.user.name
                        : 'Acesse sua conta agora',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appController.isLoggedIn
                        ? appController.user.mail
                        : 'Clique aqui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
