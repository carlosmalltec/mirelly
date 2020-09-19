import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @observable
  bool loading = false;

  @action
  redirectLoginORHome() async {
    await Future.delayed(Duration(seconds: 3));
    Modular.to.pushNamed('/home');
//    Future.wait([_seconds]).then((List value){
//      print('value $value');
//      Modular.to.pushNamed('/home');
//    });
  }
}
