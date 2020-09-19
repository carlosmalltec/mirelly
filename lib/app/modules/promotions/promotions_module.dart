import 'package:flutter/src/widgets/framework.dart';

import 'promotions_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'promotions_page.dart';

class PromotionsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PromotionsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PromotionsPage()),
      ];

  static Inject get to => Inject<PromotionsModule>.of();

  @override
  // TODO: implement view
  Widget get view => PromotionsPage();
}
