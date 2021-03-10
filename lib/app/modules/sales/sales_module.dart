import 'package:flutter/src/widgets/framework.dart';

import 'sales_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'sales_page.dart';

class SalesModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SalesController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => SalesPage()),
      ];

  static Inject get to => Inject<SalesModule>.of();

  @override
  // TODO: implement view
  Widget get view => SalesPage();
}
