import 'package:flutter/src/widgets/framework.dart';
import 'package:sistema_de_controle/app/modules/login/login_module.dart';
import 'package:sistema_de_controle/app/modules/login/login_page.dart';
import 'package:sistema_de_controle/app/modules/signup/signup_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage(), transition: TransitionType.fadeIn),
        Router('/login', module: LoginModule(), transition: TransitionType.fadeIn),
    Router('/signup', module: SignupModule(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  // TODO: implement view
  Widget get view => HomePage();
}
