import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sistema_de_controle/app/modules/category/category_controller.dart';
import 'package:sistema_de_controle/app/modules/product/validate_form_controller.dart';
import 'package:sistema_de_controle/app/modules/providers/providers_controller.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';
import 'package:sistema_de_controle/app/widgets/input_field_widgets.dart';

import 'product_controller.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    final ValidateFormController _controller = ValidateFormController();
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
                            isSuccess: controller.successProduct),
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'Título:',
                    subtitle: 'Título do produto',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                      controller: controller.titleC,
                      enabled: !controller.loadingProduct,
                      hintText: 'Exemplo: Nome',
                      errorText: controller.nameError,
                      onChanged: controller.setNameProduct,
                      maxLength: 150,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Data:',
                    subtitle: 'Data da compra',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                      controller: controller.productDateBuyC,
                      enabled: !controller.loadingProduct,
                      hintText: 'Exemplo: 00/00/0000',
                      errorText: null,
                      onChanged: controller.setProductDateBuye,
                      maxLength: 10,
                      // type: TextInputType.datetime
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Valor R\$:',
                    subtitle: 'Valor da compra',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                        controller: controller.productSaleBuyC,
                        enabled: !controller.loadingProduct,
                        hintText: 'Exemplo: 00.00',
                        onChanged: (v) => controller.setProductSaleBuy(v),
                        maxLength: 15,
                        type: TextInputType.number);
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Quantidade:',
                    subtitle: 'Total de produtos comprados',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                        controller: controller.productQuantityBuyC,
                        enabled: !controller.loadingProduct,
                        hintText: 'Exemplo: 200',
                        onChanged: (v) => controller.setProductQuantityBuy(v),
                        maxLength: 10,
                        type: TextInputType.number);
                  }),
                  Observer(builder: (_) {
                    return FieldTitle(
                      title:
                          'Valor da compra R\$: ${controller.productSaleBuyFinal}',
                      subtitle: '(Quantidade x valor de compra)',
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Lucro %:',
                    subtitle: 'Digite margem de lucro em número sem o %',
                  ),
                  Observer(builder: (_) {
                    return InputFieldWidgets(
                        controller: controller.productPercentC,
                        enabled: !controller.loadingProduct,
                        hintText: 'Exemplo: 100',
                        onChanged: (v) => controller.setProductPercent(v),
                        maxLength: 6,
                        type: TextInputType.number);
                  }),
                  Observer(builder: (_) {
                    print(
                        'productSaleAndPercent ${controller.productSaleAndPercent}');
                    return FieldTitle(
                      title:
                          'Valor de venda R\$: ${controller.productSaleAndPercent}',
                      subtitle: 'valor de compra + (Lucro x valor de compra)',
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Categoria:',
                    subtitle: 'Selecione a categoria',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: controller.productCategoryC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: Categoria',
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            controller.productCategoryC.text =
                                controller.isSelectedOptionsCategory[value];
                            controller.setProductCategory(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return controller.itemsCategory;
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Fornecedor:',
                    subtitle: 'Selecione o fornecedor',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: controller.productProviderC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: Fornecedor',
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            controller.productProviderC.text =
                                controller.isSelectedOptionsProviders[value];
                            controller.setProductProvider(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return controller.itemsProviders;
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Descrição:',
                    subtitle: 'Descrição do produto',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        controller: controller.descriptionC,
                        decoration: InputDecoration(
                          enabled: !controller.loadingProduct,
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: Descrição',
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: controller.setProductDescription,
                        maxLength: 500,
                        maxLines: 5,
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
                        child: controller.loadingProduct
                            ? CupertinoActivityIndicator()
                            : Text(
                                controller.isFormEditProduct
                                    ? 'ATUALIZAR'
                                    : 'CADASTRAR',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          print(
                              'isFormValidate => ${controller.isFormValidate}');
                          print(
                              'isFormEditProduct => ${controller.isFormEditProduct}');
                          print(
                              'loadingProduct => ${controller.loadingProduct}');
                          print('prepareProduct => ${controller.prepareProduct.toString()}');
                          print('Novo => ${controller.isFormValidate && !controller.isFormEditProduct && !controller.loadingProduct}');
                          print('Editar => ${controller.isFormValidate && controller.isFormEditProduct && !controller.loadingProduct}');

                          if (controller.isFormValidate && controller.isFormEditProduct && !controller.loadingProduct)
                            controller.saveEdit(controller.prepareProduct);
                          if (controller.isFormValidate && !controller.isFormEditProduct && !controller.loadingProduct)
                            controller.newProduct(controller.prepareProduct);
                        },
                        // onPressed:() => (_controller.isFormValidate && controller.isFormEditProduct && !controller.loadingProduct) ?
                        // controller.saveEdit(controller.prepareProduct) :
                        // controller.newProduct(controller.prepareProduct),
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
