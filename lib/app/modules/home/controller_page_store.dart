import 'package:mobx/mobx.dart';
part 'controller_page_store.g.dart';

class ControllerPageStore = _ControllerPageStore with _$ControllerPageStore;

abstract class _ControllerPageStore with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}