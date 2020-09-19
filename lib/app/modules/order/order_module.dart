import 'package:flutter/src/widgets/framework.dart';

import 'order_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'order_page.dart';

class OrderModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrderController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OrderPage()),
      ];

  static Inject get to => Inject<OrderModule>.of();

  @override
  // TODO: implement view
  Widget get view => OrderPage();
}
