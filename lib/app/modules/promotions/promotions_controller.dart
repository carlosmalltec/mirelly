import 'package:mobx/mobx.dart';

part 'promotions_controller.g.dart';

class PromotionsController = _PromotionsControllerBase
    with _$PromotionsController;

abstract class _PromotionsControllerBase with Store {
  @observable
  int value = 0;

  @action
  swipeRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
  @action
  void increment() {
    value++;
  }
}
