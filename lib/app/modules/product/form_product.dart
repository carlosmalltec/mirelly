import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sistema_de_controle/app/modules/product/validate_form_controller.dart';
import 'package:sistema_de_controle/app/widgets/error_box.dart';
import 'package:sistema_de_controle/app/widgets/field_title.dart';

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
    var _currencies = [
      "Food",
      "Transport",
      "Personal",
      "Shopping",
      "Medical",
      "Rent",
      "Movie",
      "Salary"
    ];
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
                    return TextField(
                      controller: _controller.titleC,
                      decoration: InputDecoration(
                          enabled: !controller.loadingProduct,
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: GEL CREME PROTETOR',
                          errorText: _controller.nameError),
                      keyboardType: TextInputType.text,
                      onChanged: _controller.setName,
                      maxLength: 150,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Data:',
                    subtitle: 'Data da compra',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: _controller.productDateBuyC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: 00/00/0000',
//                          errorText: controller.nameError,
                      ),
                      keyboardType: TextInputType.datetime,
                      onChanged: _controller.setProductDateBuye,
                      maxLength: 10,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Valor R\$:',
                    subtitle: 'Valor da compra',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: controller.productSaleBuyC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: 99.99',
//                          errorText: controller.nameError,
                      ),
//                      inputFormatters: [
//                        WhitelistingTextInputFormatter.digitsOnly,
//                        CurrencyInputFormatter()
//                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        _controller.setProductSaleBuy(value);
                      },
                      maxLength: 15,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Quantidade:',
                    subtitle: 'Total de produtos comprados',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: _controller.productQuantityBuyC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: 200',
//                          errorText: controller.nameError,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        _controller.setProductQuantityBuy(value);
                      },
                      maxLength: 10,
                    );
                  }),
                  Observer(builder: (_) {
                    return FieldTitle(
                      title: 'Valor da compra R\$: ${_controller.productSaleBuyFinal}',
                      subtitle: '(Quantidade x valor de compra)',
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Lucro %:',
                    subtitle: 'Digite margem de lucro em número sem o %',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      controller: _controller.productPercentC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: 100',
//                          errorText: controller.nameError,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        _controller.setProductPercent(value);
                      },
                      maxLength: 6,
                    );
                  }),
                  Observer(builder: (_) {
                    print('productSaleAndPercent ${_controller.productSaleAndPercent}');
                    return FieldTitle(
                      title: 'Valor de venda R\$: ${_controller.productSaleAndPercent}',
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
                      controller: _controller.productCategoryC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: Categoria',
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller.productCategoryC.text = value;
                            _controller.setProductCategory(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return _currencies
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
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
                      controller: _controller.productProviderC,
                      decoration: InputDecoration(
                        enabled: !controller.loadingProduct,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Exemplo: Fornecedor',
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            _controller.productProviderC.text = value;
                            _controller.setProductProvider(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return _currencies
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
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
//                            errorText: controller.productDescriptionError,
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: controller.setProductDescription,
                        maxLines: 5,
                        maxLength: 500,
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
                          print(controller.isFormEditProduct);
                          controller.isFormEditProduct
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



//class CurrencyInputFormatter extends TextInputFormatter {
//
//  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//
//    if(newValue.selection.baseOffset == 0){
//      print(true);
//      return newValue;
//    }
//
//    double value = double.parse(newValue.text);
//
//    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");
//
//    String newText = formatter.format(value/100);
//
//    return newValue.copyWith(
//        text: newText,
//        selection: new TextSelection.collapsed(offset: newText.length));
//  }
//}