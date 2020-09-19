import 'package:mobx/mobx.dart';

part 'promotions_controller.g.dart';

class PromotionsController = _PromotionsControllerBase
    with _$PromotionsController;

abstract class _PromotionsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
