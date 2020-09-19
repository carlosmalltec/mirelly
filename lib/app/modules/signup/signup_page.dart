import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Cadastra-se"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 8.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Observer(
                        builder: (_){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ErrorBox(
                              message:controller.error
                            ),
                          );
                        },
                      ),
                      FieldTitle(
                        title: 'Nome:',
                        subtitle: 'Informe nome e sobrenome',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                              enabled: !controller.loading,
                              border: const OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Exemplo: Maria das Graças',
                              errorText: controller.nameError),
                          keyboardType: TextInputType.text,
                          onChanged: controller.setName,
                        );
                      }),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Contato:',
                        subtitle: 'Informe seu número de contato',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                                enabled: !controller.loading,
                                border: const OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Exemplo: (11) 90000-0000'),
                            keyboardType: TextInputType.phone,
                            onChanged: controller.setContact,
                            inputFormatters: [
                              WhitelistingTextInputFormatter
                                  .digitsOnly, //somente numero
                              TelefoneInputFormatter(),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'E-mail:',
                        subtitle: 'Informe um e-mail válido',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                              enabled: !controller.loading,
                              border: const OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Exemplo: maria@gmail.com',
                              errorText: controller.mailError),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: controller.setMail,
                          autocorrect: false,
                        );
                      }),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Senha:',
                        subtitle: 'Crie uma senha de acesso',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                                enabled: !controller.loading,
                                border: const OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Exemplo: 12345',
                                errorText: controller.passwordError),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onChanged: controller.setPassword,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Confirmar senha:',
                        subtitle: 'Redigite a mesma senha informada',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                                enabled: !controller.loading,
                                border: const OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Exemplo: 12345',
                                errorText: controller.confirmarPasswordError),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onChanged: controller.setConfirmarPassword,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Observer(builder: (_) {
                        return Container(
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: controller.loading
                                ? CupertinoActivityIndicator()
                                : Text(
                                    'CADASTRAR',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: controller.signUpPressed,
                            disabledTextColor: Colors.white,
                            disabledColor:
                                Theme.of(context).primaryColor.withOpacity(0.4),
                          ),
                        );
                      }),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Já tem uma conta?',
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed('/login');
                              },
                              child: Text(
                                ' Entrar',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
