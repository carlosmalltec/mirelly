import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';
import 'package:sistema_de_controle/app/widgets/input_field_widgets.dart';

import 'providers_controller.dart';

class FormProviders extends StatelessWidget {
  const FormProviders({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProvidersController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ErrorBox(
                          message: controller.error,
                          isSuccess: controller.successProvider,
                        ),
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'Fornecedor:',
                    subtitle: 'Informe o nome do fornecedor',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                      controller: controller.titleProviderController,
                      enabled: !controller.loadingProvider,
                      hintText: 'Exemplo: Natura',
                      errorText: controller.nameError,
                      onChanged: controller.setName,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Descrição:',
                    subtitle: 'Informe alguma observação sobre o fornecedor',
                  ),
                  Observer(
                    builder: (_) {
                      return InputFieldWidgets(
                        controller: controller.descriptionProvidersController,
                        enabled: !controller.loadingProvider,
                        hintText: 'Exemplo: Observações',
                        errorText: controller.providerDescriptionError,
                        onChanged: controller.setProviderDescription,
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
                        child: controller.loadingProvider
                            ? CupertinoActivityIndicator()
                            : Text(controller.isFormEditProvider ? 'ATUALIZAR':'CADASTRAR',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: (){
                          print( controller.isFormEditProvider);
                          controller.isFormEditProvider ? controller.editPressed() : controller.newPressed();
                        },
                        disabledTextColor: Colors.white,
                        disabledColor:
                        Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}