import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientControllerBase with _$ClientController;

abstract class _ClientControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
