import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/app_controller.dart';
import 'package:sistema_de_controle/app/modules/models/user.dart';
import 'package:sistema_de_controle/app/modules/repositories/user_repository.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  @observable
  String name;

  @action
  void setName(value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 4;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Nome obrigatório';
    } else {
      return 'Informe nome e sobrenome';
    }
  }

  @observable
  String contact;

  @action
  void setContact(value) => contact = value;

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
  String confirmarPassword;

  @action
  void setConfirmarPassword(value) => confirmarPassword = value;

  @computed
  bool get confirmarPasswordValid =>
      confirmarPassword != null && confirmarPassword == password;
  String get confirmarPasswordError {
    if (confirmarPassword == null || confirmarPasswordValid) {
      return null;
    } else {
      return 'Senhas não coincidem.';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && passwordValid && confirmarPasswordValid;

  @observable
  bool loading = false;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;
    final User user =
        User(name: name, mail: mail, contact: contact, password: password);

    try{
      final response = await UserRepository().signUp(user);
      GetIt.I<AppController>().setUser(response);
      loading = false;
      error = null;
    }catch(e){
      error = e;
      loading = false;
    }
  }
}
