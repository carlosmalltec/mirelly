import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/category/repository/category_repository.dart';
import 'package:sistema_de_controle/app/modules/models/product.dart';
import 'package:sistema_de_controle/app/modules/providers/repository/provider_repository.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';

import 'repository/product_repository.dart';
import 'validate_form_controller.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase extends ValidateFormController
    with Store {
  final ValidateFormController _validateForm = ValidateFormController();

  ObservableList<Product> listDataProduct = ObservableList<Product>();

  ObservableMap<String, bool> isExpandedMapProduct =
      ObservableMap<String, bool>();

  @observable
  LoadingStatus isLoading = LoadingStatus.notLoading;

  @observable
  bool loadingProduct = false;

  @observable
  bool isExpandedProduct = false;

  @observable
  bool successProduct = false;

  @observable
  bool isFormEditProduct = false;

  @observable
  bool isChangeScreenProduct = false;

  @observable
  String editIDProduct = '';

  static const _loadMorePageConst = 0.9;

  bool _canLoadOnScroll = false;

  @action
  void setChangeForm() => isChangeScreenProduct = true;

  @action
  void setChangeList() => isChangeScreenProduct = false;

  @observable
  String error;

  @action
  getFirstPage([isFirst = false]) async {
    if (isFirst) {
      isLoading = LoadingStatus.shimmerLoading;

      listCategorysEnabled(true);
      listProvidersEnabled(true);
    } else {
      isLoading = LoadingStatus.fullLoading;
    }
    listDataProduct.clear();
    await _findAll();
  }

  @action
  swipeRefresh() async {
    isLoading = LoadingStatus.shimmerLoading;
    listDataProduct.clear();
    await _findAll(true);
  }

  @action
  getNextPage() async {
    if (isLoading != LoadingStatus.notLoading) return;
    isLoading = LoadingStatus.nextPageLoading;
    await _findAll();
  }

  @action
  onScroll(double scrollPosition, double scrollMax) async {
    if (!_canLoadOnScroll) return;
    if (scrollPosition > scrollMax * _loadMorePageConst) {
      _canLoadOnScroll = false;
      getNextPage();
    }
  }

  _findAll([clearList = false]) async {
    try {
      final response = await ProductRepository().findAll().catchError((e) {
        print(e);
      });
      if (clearList) listDataProduct.clear();
      if (response != null) {
        response.asMap().forEach((key, value) {
          isExpandedMapProduct[value.id] = value.isExpanded;
        });
        listDataProduct.addAll(response);
      }
      isLoading = LoadingStatus.notLoading;
      _canLoadOnScroll = true;
    } catch (e) {}
  }

  @action
  changeIsExpanded(String id, bool change) {
    isExpandedProduct = true;
    isExpandedMapProduct[id] = !isExpandedMapProduct[id];
    isExpandedProduct = false;
  }

  @action
  excluir(Product prod) async {
    listDataProduct.remove(prod);
    await ProductRepository().excluir(prod);
  }

  _setController({Product prod, isempty = false}) {
    if (isempty) {
      titleC.clear();
      descriptionC.clear();
      productDateBuyC.clear();
      productSaleBuyC.clear();
      productQuantityBuyC.clear();
      productSumBuyC.clear();
      productPercentC.clear();
      productSalesC.clear();
      productQuantityStockC.clear();
      productCategoryC.clear();
      productProviderC.clear();
    }
    if (prod.id != null && !isempty) {
      titleC.text = prod.title;
      descriptionC.text = prod.description;
      productDateBuyC = MaskedTextController(mask: '00/00/0000', text: prod.dateBuy.toString());
      productSaleBuyC = MoneyMaskedTextController(
          initialValue: prod.saleBuy,
          leftSymbol: 'R\$ ',
          precision: 2,
          decimalSeparator: '.',
          thousandSeparator: ',');
      productQuantityBuyC= MaskedTextController(mask: '000000', text: prod.quantityBuy.toString());
      productSumBuyC  =  MoneyMaskedTextController(
        initialValue: prod.sumBuy,
          leftSymbol: 'R\$ ',
          precision: 2,
          decimalSeparator: '.',
          thousandSeparator: ',');
      productPercentC = MaskedTextController(mask: '000', text: prod.percent.toString());
      productSalesC = MoneyMaskedTextController(
        initialValue: prod.sales,
//      leftSymbol: 'R\$ ',
          precision: 2,
          decimalSeparator: ',',
          thousandSeparator: '.');
      productQuantityStockC  = MaskedTextController(mask: '000000', text: prod.quantityStock.toString());
      productCategoryC.text = isSelectedOptionsCategory[prod.category];
      productProviderC.text = isSelectedOptionsProviders[prod.provider];

      productName = prod.title;
      productDateBuy = prod.dateBuy;
      productDescription = prod.description;
      productSaleBuy = prod.saleBuy.toString();
      productQuantityBuy = prod.quantityBuy.toString();
      productPercent = prod.percent.toString();
      productQuantityStock = prod.quantityStock.toString();
      productCategory = prod.category;
      productProvider = prod.provider;
    }
  }

  @observable
  Product productObject = Product();

  @action
  setFormUpdate(Product prod) {
    productObject = prod;
    isChangeScreenProduct = true; //form
    isFormEditProduct = true; //habilita mais campos
    _setController(prod: prod);
    editIDProduct = prod.id;
  }

  @action
  changeStatus(Product prod) async {
    final Product data = _validateForm.productUpdate(prod: prod, status: true);
    listDataProduct.remove(prod);
    listDataProduct.insert(0, data);
    editIDProduct = prod.id;
    await ProductRepository().update(editIDProduct, data);
  }

  @action
  saveEdit(Product prod) async {
    loadingProduct = true;
    successProduct = false;
    error = null;
    final update = await ProductRepository().update(editIDProduct, prod);
    listDataProduct.remove(productObject);
    listDataProduct.insert(0, update);
    loadingProduct = false;
    isFormEditProduct = false;
    successProduct = true;
    error = 'Alteração com sucesso!';
    // _setController(isempty: true);
    await Future.delayed(Duration(seconds: 3));
    setChangeList();
    isLoading = LoadingStatus.notLoading;
    _canLoadOnScroll = true;
    successProduct = false;
    error = null;
  }

  @action
  newProduct(Product prod) async {
    loadingProduct = true;
    successProduct = false;
    error = null;
    try {
      final response = await ProductRepository().save(prod);
      isExpandedMapProduct[response.id] = response.isExpanded;
      listDataProduct.insert(0, response);
      loadingProduct = false;
      successProduct = true;
      error = 'Seu cadastro foi realizado com sucesso!';
      // _setController(isempty: true);
      await Future.delayed(Duration(seconds: 3));
      setChangeList();
      successProduct = false;
      error = null;
      isLoading = LoadingStatus.notLoading;
      _canLoadOnScroll = true;
    } catch (e) {
      print('eeeddddd ${e.toString()}');
      error = e.toString();
      loadingProduct = false;
      successProduct = false;
    }
  }

  @observable
  List<PopupMenuItem<String>> itemsProviders =
      <PopupMenuItem<String>>[].asObservable();

  @observable
  List<PopupMenuItem<String>> itemsCategory =
      <PopupMenuItem<String>>[].asObservable();

  ObservableMap<String, String> isSelectedOptionsProviders =
      ObservableMap<String, String>();
  ObservableMap<String, String> isSelectedOptionsCategory =
      ObservableMap<String, String>();

  @action
  listProvidersEnabled([clearList = false]) async {
    try {
      final response = await ProviderRepository().listProvider();
      if (clearList) itemsProviders.clear();
      if (clearList) isSelectedOptionsProviders.clear();
      if (response != null) {
        response.asMap().forEach((key, value) {
          itemsProviders.add(PopupMenuItem(
              child: Text(value.title),
              value: value.id,
              key: ValueKey(value.id)));
          isSelectedOptionsProviders[value.id] = value.title;
        });
      }
    } catch (e) {}
  }

  @action
  listCategorysEnabled([clearList = false]) async {
    try {
      final response = await CategoryRepository().listCategory();
      if (clearList) itemsCategory.clear();
      if (clearList) isSelectedOptionsCategory.clear();
      if (response != null) {
        response.asMap().forEach((key, value) {
          itemsCategory.add(PopupMenuItem(
              child: Text(value.title),
              value: value.id,
              key: ValueKey(value.id)));
          isSelectedOptionsCategory[value.id] = value.title;
        });
      }
    } catch (e) {}
  }
}
