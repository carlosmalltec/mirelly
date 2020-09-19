import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/app_controller.dart';
import 'package:sistema_de_controle/app/modules/repositories/user_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  String mail;

  @action
  void setMail(value) => mail = value;

  @computed
  bool get isEmailValid => RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(mail);
  bool get emailValid => mail != null && isEmailValid;
  String get mailError {
    if (mail == null || isEmailValid) {
      return null;
    } else if (mail.isEmpty) {
      return 'E-mail obrigatório';
    } else {
      return 'E-mail não é válido';
    }
  }

  @observable
  String password;

  @action
  void setPassword(value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length > 4;
  String get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password.isEmpty) {
      return 'Senha obrigatória';
    } else {
      return 'Senha deve ser maior que 4 digitos';
    }
  }

  @observable
  bool loading = false;

  @computed
  Function get loginPressed => (passwordValid && emailValid && !loading) ? _login : null;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;
    try{
      final user = await UserRepository().loginWithEmail(mail, password);
      print(user.toString());
      GetIt.I<AppController>().setUser(user);
      loading = false;
      error = null;
    }catch(e){
      error = e;
      loading = false;
    }
  }

}
