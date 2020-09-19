import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:sistema_de_controle/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_controller.dart';
import 'app/modules/home/controller_page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //garante a inicialização e depois roda o restante
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ),
  );
  setpLocators();
  await initializeParse();
  runApp(ModularApp(module: AppModule()));
}

//distribuir para todo o app
void setpLocators(){
  GetIt.I.registerSingleton(ControllerPageStore());
  GetIt.I.registerSingleton(AppController());
}

Future<void> initializeParse() async {
  Parse().initialize('JYqHshipJXUBaKaK7Ovd54ILKTuaSitbrtLmY36x',
      'https://parseapi.back4app.com/',
      clientKey: 'qtubo4rZ6SvYAynAtYlE1AX9YEXHdsUB7KwS8TxH',
      autoSendSessionId: true,
      debug: false);
}
