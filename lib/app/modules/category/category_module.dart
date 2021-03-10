import 'package:flutter/src/widgets/framework.dart';

import 'category_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'category_page.dart';

class CategoryModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoryController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => CategoryPage()),
      ];

  static Inject get to => Inject<CategoryModule>.of();

  @override
  // TODO: implement view
  Widget get view => CategoryPage();
}
