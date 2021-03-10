import 'package:flutter/src/widgets/framework.dart';
import 'package:sistema_de_controle/app/modules/signup/signup_module.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';

class LoginModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();

  @override
  // TODO: implement view
  Widget get view => LoginPage();
}
