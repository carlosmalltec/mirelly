import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/modules/category/category_controller.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';

class NewCategory extends StatefulWidget {
  @override
  _NewCategoryState createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final CategoryController _categoryController = Modular.get<CategoryController>();
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
                    builder: (_){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ErrorBox(
                            message:_categoryController.error
                        ),
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'Categoria:',
                    subtitle: 'Informe o nome da categoria',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          enabled: !_categoryController.loading,
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: Creme, Battom',
                          errorText: _categoryController.nameError),
                      keyboardType: TextInputType.text,
                      onChanged: _categoryController.setName,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Descrição:',
                    subtitle: 'Informe alguma observação sobre a categoria',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !_categoryController.loading,
                            border: const OutlineInputBorder(),
                            isDense: true,
                            hintText: 'Exemplo: Creme-P2 somente p/ proteção da pele',
                            errorText: _categoryController.categoryDescriptionError),
                        keyboardType: TextInputType.text,
                        onChanged: _categoryController.setCategoryDescription,
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
                        child: _categoryController.loading
                            ? CupertinoActivityIndicator()
                            : Text(
                          'CADASTRAR ITEM',
                          style:
                          TextStyle(fontWeight: FontWeight.w600),
                        ),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: _categoryController.newPressed,
                        disabledTextColor: Colors.white,
                        disabledColor:
                        Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    );
                  }),
                  Divider(color: Theme.of(context).accentColor),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
