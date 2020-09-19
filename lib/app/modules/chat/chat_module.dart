import 'package:flutter/src/widgets/framework.dart';

import 'chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'chat_page.dart';

class ChatModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChatPage()),
      ];

  static Inject get to => Inject<ChatModule>.of();

  @override
  // TODO: implement view
  Widget get view => ChatPage();
}
