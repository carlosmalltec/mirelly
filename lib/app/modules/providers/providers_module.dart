import 'package:flutter/src/widgets/framework.dart';

import 'providers_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'providers_page.dart';

class ProvidersModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProvidersController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProvidersPage()),
      ];

  static Inject get to => Inject<ProvidersModule>.of();

  @override
  Widget get view => ProvidersPage();
}
