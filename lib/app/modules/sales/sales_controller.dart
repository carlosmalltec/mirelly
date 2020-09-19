import 'package:mobx/mobx.dart';

part 'sales_controller.g.dart';

class SalesController = _SalesControllerBase with _$SalesController;

abstract class _SalesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
