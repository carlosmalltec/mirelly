import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/models/product.dart';
part 'validate_form_controller.g.dart';

class ValidateFormController = _ValidateFormController
    with _$ValidateFormController;

abstract class _ValidateFormController with Store, Disposable {
  @observable
  TextEditingController titleC = TextEditingController();

  @observable
  TextEditingController descriptionC = TextEditingController();

  @observable
  TextEditingController productDateBuyC =
      MaskedTextController(mask: '00/00/0000', text: '');

  @observable
  TextEditingController productSaleBuyC = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      precision: 2,
      decimalSeparator: '.',
      thousandSeparator: ',');

  @observable
  TextEditingController productQuantityBuyC =
      MaskedTextController(mask: '0000000000', text: '');

  @observable
  TextEditingController productSumBuyC = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      precision: 2,
      decimalSeparator: '.',
      thousandSeparator: ',');

  @observable
  TextEditingController productPercentC =
      MaskedTextController(mask: '0000', text: '');

  @observable
  TextEditingController productSalesC = MoneyMaskedTextController(
//      leftSymbol: 'R\$ ',
      precision: 2,
      decimalSeparator: ',',
      thousandSeparator: '.');

  @observable
  TextEditingController productQuantityStockC =
      MaskedTextController(mask: '000000', text: '');

  @observable
  TextEditingController productCategoryC = TextEditingController();

  @observable
  TextEditingController productProviderC = TextEditingController();

  @observable
  String productName;

  @action
  void setName(value) => productName = value;

  @computed
  bool get productNameValid => productName != null && productName.length > 2;
  String get nameError {
    if (productName == null || productNameValid) {
      return null;
    } else if (productName.isEmpty) {
      return 'Título obrigatório';
    } else {
      return 'Informe nome do produto';
    }
  }

  @observable
  String productDescription;

  @action
  void setProductDescription(value) => productDescription = value;

  @observable
  DateTime productDateBuy;

  @action
  void setProductDateBuye(value) => productDateBuy = value;

  @observable
  String productDate;

  @action
  void setProductDate(value) => productDate = value;

  @observable
  String productSaleBuy;

  @action
  void setProductSaleBuy(value) => productSaleBuy = value;

  @observable
  String productQuantityBuy;

  @action
  void setProductQuantityBuy(value) => productQuantityBuy = value;

  @observable
  String productSumBuy;

  @action
  void setProductSumBuy(value) => productSumBuy = value;

  @observable
  String productPercent;

  @action
  void setProductPercent(value) => productPercent = value;

  @observable
  String productSales;

  @action
  void setProductSales(value) => productSales = value;

  @observable
  String productQuantityStock;

  @action
  void setProductQuantityStock(value) => productQuantityStock = value;

  @observable
  String productCategory;

  @action
  void setProductCategory(value) => productCategory = value;

  @observable
  String productProvider;

  @action
  void setProductProvider(value) => productProvider = value;

  @computed
  double get productSaleBuyFinal =>
      (productSaleBuy != null && productQuantityBuy != null)
          ? _sumProductSaleBuyANDProductQuantityBuy(
              productQuantityBuy, productSaleBuy)
          : 0.0;

  _sumProductSaleBuyANDProductQuantityBuy(qt, value) {
    if (qt != '' && value != null) {
      double q = double.parse(qt);
      double v = _formatNumber(value);
      double t = (q * v);
      return t;
    }
    return 0.0;
  }

  @computed
  get productSaleAndPercent =>
      (productPercent != '' && productSaleBuy != '') ? _sumPercent(productPercent) : 0.0;

  _sumPercent(percent) {
    if (percent != '' && productSaleBuy != null) {
      double p = double.parse(percent);
      double v = _formatNumber(productSaleBuy);
      double t = v + (p * v) /100;
      return t;
    }
    return 0.0;
  }

  double _formatNumber(dynamic value) {
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    double _doubleValue = double.parse(_onlyDigits) / 100;
    return _doubleValue;
  }

  @computed
  bool get isFormValidate => productNameValid;

  Product get prepareProduct => Product(
        title: productName,
        dateBuy: productDateBuy ?? DateTime.now(),
        description: productDescription ?? '',
        saleBuy: productSaleBuy ?? 0.00,
        quantityBuy: productQuantityBuy ?? 1,
        sumBuy: productSaleBuyFinal ?? 0.00,
        percent: productPercent ?? 00,
        sales: _sumPercent ?? 0.00,
        quantityStock: productQuantityStock ?? 1,
        category: productCategory ?? '',
        provider: productProvider ?? '',
        isExpanded: false,
        status: ProductStatus.ATIVO,
      );

  Product productUpdate(Product prod) {
    return Product(
      id: prod.id,
      title: prod.title,
      dateBuy: prod.dateBuy,
      description: prod.description,
      saleBuy: prod.saleBuy,
      quantityBuy: prod.quantityBuy,
      sumBuy: prod.sumBuy,
      percent: prod.percent,
      sales: prod.sales,
      quantityStock: prod.quantityStock,
      category: prod.category,
      provider: prod.provider,
      isExpanded: false,
      status: prod.status,
    );
  }

//  product.set<DateTime>(TableKeys.productDateBuy, c.dateBuy);
//  product.set<double>(TableKeys.productSaleBuy, c.saleBuy);
//  product.set<int>(TableKeys.productQuantityBuy, c.quantityBuy);

//  product.set<double>(TableKeys.productSumBuy, c.sumBuy); *
//
//  product.set<double>(TableKeys.productPercent, c.percent);
//  product.set<double>(TableKeys.productSales, c.sales);
//  product.set<int>(TableKeys.productQuantityStock, c.quantityStock);
//
//  product.set<String>(TableKeys.productCategory, c.category);
//  product.set<String>(TableKeys.productProvider, c.provider);

  @override
  void dispose() {
    titleC.dispose();
    descriptionC.dispose();

    productDateBuyC.dispose();
    productSaleBuyC.dispose();
    productQuantityBuyC.dispose();
    productSumBuyC.dispose();

    productPercentC.dispose();
    productSalesC.dispose();
    productQuantityStockC.dispose();

    productCategoryC.dispose();
    productProviderC.dispose();
  }
}
