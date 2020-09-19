import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/repositories/user_repository.dart';

import 'modules/models/user.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  _AppControllerBase(){
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }
}
