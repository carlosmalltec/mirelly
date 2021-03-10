import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sistema_de_controle/app/modules/category/category_controller.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';
import 'package:sistema_de_controle/app/widgets/input_field_widgets.dart';

class FormCategory extends StatelessWidget {
  const FormCategory({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final CategoryController controller;

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
                          isSuccess: controller.success,
                        ),
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'Categoria:',
                    subtitle: 'Informe o nome da categoria',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                      controller: controller.titleCategoryController,
                      enabled: !controller.loading,
                      hintText: 'Exemplo: Creme, Battom',
                      errorText: controller.nameError,
                      onChanged: controller.setName,
                    );
                    // return TextField(
                    //   controller: controller.titleCategoryController,
                    //   decoration: InputDecoration(
                    //       enabled: !controller.loading,
                    //       border: const OutlineInputBorder(),
                    //       isDense: true,
                    //       hintText: 'Exemplo: Creme, Battom',
                    //       errorText: controller.nameError),
                    //   keyboardType: TextInputType.text,
                    //   onChanged: controller.setName,
                    // );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Descrição:',
                    subtitle: 'Informe alguma observação sobre a categoria',
                  ),
                  Observer(
                    builder: (_) {
                      return InputFieldWidgets(
                        controller: controller.descriptionCategoryController,
                        enabled: !controller.loading,
                        hintText: 'Exemplo: Creme Hidratante',
                        errorText: controller.categoryDescriptionError,
                        onChanged: controller.setCategoryDescription,
                      );
                      // return TextField(
                      //   controller: controller.descriptionCategoryController,
                      //   decoration: InputDecoration(
                      //       enabled: !controller.loading,
                      //       border: const OutlineInputBorder(),
                      //       isDense: true,
                      //       hintText: 'Exemplo: Creme Hidratante',
                      //       errorText: controller.categoryDescriptionError),
                      //   keyboardType: TextInputType.text,
                      //   onChanged: controller.setCategoryDescription,
                      // );
                    },
                  ),
                  const SizedBox(height: 16),
                  Observer(builder: (_) {
                    var _bt =
                        controller.isFormEdit ? 'ATUALIZAR' : 'CADASTRAR ITEM';
                    return Container(
                      height: 40.0,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: controller.loading
                            ? CupertinoActivityIndicator()
                            : Text(
                                controller.isFormEdit
                                    ? 'ATUALIZAR'
                                    : 'CADASTRAR ITEM',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          print(controller.isFormEdit);
                          controller.isFormEdit
                              ? controller.editPressed()
                              : controller.newPressed();
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
