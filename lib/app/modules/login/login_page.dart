import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Entrar"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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
                      Text(
                        'Acesse sua conta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).accentColor),
                      ),
                      Observer(
                        builder: (_){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: ErrorBox(
                                message:controller.error
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            hintText: 'Exemplo: maria@gmail.com',
                            enabled: !controller.loading,
                              errorText: controller.mailError
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: controller.setMail,
                          autocorrect: false,
                        );
                      }),
                      const SizedBox(height: 16),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 3, bottom: 4),
                              child: Text(
                                'Senha',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Exemplo: 12345',
                              enabled: !controller.loading,
                                errorText: controller.passwordError
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onChanged: controller.setPassword,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Observer(
                        builder: (_) {
                          return Container(
                            height: 40.0,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              child: controller.loading
                                  ? CupertinoActivityIndicator()
                                  : Text(
                                      'ENTRAR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                              textColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: controller.loginPressed,
                              disabledTextColor: Colors.white,
                              disabledColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Não tem uma conta?',
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed('/home/signup');
                              },
                              child: Text(
                                ' Cadastre-se',
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
