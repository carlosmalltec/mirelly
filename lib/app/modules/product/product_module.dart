import 'package:flutter/src/widgets/framework.dart';

import 'product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'product_page.dart';

class ProductModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProductPage()),
      ];

  static Inject get to => Inject<ProductModule>.of();

  @override
  // TODO: implement view
  Widget get view => ProductPage();
}
