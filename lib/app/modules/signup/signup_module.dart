import 'package:flutter/src/widgets/framework.dart';

import 'signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'signup_page.dart';

class SignupModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();

  @override
  // TODO: implement view
  Widget get view => SignupPage();
}
