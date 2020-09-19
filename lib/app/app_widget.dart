import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xffE88E00));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Sistema de controle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffE88E00),
        accentColor: Color(0xff45403D),
        scaffoldBackgroundColor:  Color(0xffE88E00),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0.0
        ),
        cursorColor: Colors.orange
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
