import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/models/product.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';

import 'repository/product_repository.dart';
import 'validate_form_controller.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase extends ValidateFormController with Store , Disposable{

  ObservableList<Product> listDataProduct = ObservableList<Product>();

  ObservableMap<String, bool> isExpandedMapProduct = ObservableMap<String, bool>();

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


  @computed
  Function get newPressed => (isFormValidate && !loadingProduct) ? _newProduct : null;

  @computed
  Function get editPressed =>
      (isFormValidate && !loadingProduct && isFormEditProduct) ? _saveEdit : null;

  @action
  getFirstPage([isFirst = false]) async {
    if (isFirst) {
      isLoading = LoadingStatus.shimmerLoading;
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
      final response = await ProductRepository().findAll();
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
    final delete = await ProductRepository().excluir(prod);
  }

  @action
  setFormUpdate(Product prod) {
    isChangeScreenProduct = true; //form
    isFormEditProduct = true; //habilita mais campos
    productUpdate(prod);
    editIDProduct = prod.id;
    listDataProduct.remove(prod);
  }

  @action
  changeStatus(Product prod) async {
    final Product data = productUpdate(prod);
    listDataProduct.remove(prod);
    listDataProduct.insert(0, data);
    editIDProduct = prod.id;
    final update = await ProductRepository().update(editIDProduct, data);
  }

  _saveEdit() async {
    loadingProduct = true;
    successProduct = false;
    error = null;
    final Product data = prepareProduct;
    final update = await ProductRepository().update(editIDProduct, data);
    listDataProduct.insert(0, update);
    loadingProduct = false;
    isFormEditProduct = false;
    successProduct = true;
    error = 'Alteração com sucesso!';
    titleC.clear();
    productName = null;
    await Future.delayed(Duration(seconds: 3));
    successProduct = false;
    error = null;
  }

  _newProduct() async {
    loadingProduct = true;
    successProduct = false;
    error = null;
    final Product data = prepareProduct;
    try {
      final response = await ProductRepository().save(data);
      isExpandedMapProduct[response.id] = response.isExpanded;
      listDataProduct.insert(0, response);
      loadingProduct = false;
      successProduct = true;
      error = 'Seu cadastro foi realizado com sucesso!';
      titleC.clear();
      productName = null;
      await Future.delayed(Duration(seconds: 3));
      successProduct = false;
      error = null;
    } catch (e) {
      error = e;
      loadingProduct = false;
    }
  }
}
