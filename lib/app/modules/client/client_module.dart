import 'package:flutter/src/widgets/framework.dart';

import 'client_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'client_page.dart';

class ClientModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientPage()),
      ];

  static Inject get to => Inject<ClientModule>.of();

  @override
  // TODO: implement view
  Widget get view => ClientPage();
}
