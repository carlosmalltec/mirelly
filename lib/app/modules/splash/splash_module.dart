import 'package:flutter/src/widgets/framework.dart';
import 'package:sistema_de_controle/app/modules/home/home_module.dart';

import 'splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_page.dart';

class SplashModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute,
            child: (_, args) => SplashPage(),
            transition: TransitionType.fadeIn),
    ModularRouter('/home',
            module: HomeModule(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<SplashModule>.of();

  @override
  // TODO: implement view
  Widget get view => SplashPage();
}
