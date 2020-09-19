// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductControllerBase, Store {
  Computed<Function> _$newPressedComputed;

  @override
  Function get newPressed =>
      (_$newPressedComputed ??= Computed<Function>(() => super.newPressed,
              name: '_ProductControllerBase.newPressed'))
          .value;
  Computed<Function> _$editPressedComputed;

  @override
  Function get editPressed =>
      (_$editPressedComputed ??= Computed<Function>(() => super.editPressed,
              name: '_ProductControllerBase.editPressed'))
          .value;

  final _$isLoadingAtom = Atom(name: '_ProductControllerBase.isLoading');

  @override
  LoadingStatus get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(LoadingStatus value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loadingProductAtom =
      Atom(name: '_ProductControllerBase.loadingProduct');

  @override
  bool get loadingProduct {
    _$loadingProductAtom.reportRead();
    return super.loadingProduct;
  }

  @override
  set loadingProduct(bool value) {
    _$loadingProductAtom.reportWrite(value, super.loadingProduct, () {
      super.loadingProduct = value;
    });
  }

  final _$isExpandedProductAtom =
      Atom(name: '_ProductControllerBase.isExpandedProduct');

  @override
  bool get isExpandedProduct {
    _$isExpandedProductAtom.reportRead();
    return super.isExpandedProduct;
  }

  @override
  set isExpandedProduct(bool value) {
    _$isExpandedProductAtom.reportWrite(value, super.isExpandedProduct, () {
      super.isExpandedProduct = value;
    });
  }

  final _$successProductAtom =
      Atom(name: '_ProductControllerBase.successProduct');

  @override
  bool get successProduct {
    _$successProductAtom.reportRead();
    return super.successProduct;
  }

  @override
  set successProduct(bool value) {
    _$successProductAtom.reportWrite(value, super.successProduct, () {
      super.successProduct = value;
    });
  }

  final _$isFormEditProductAtom =
      Atom(name: '_ProductControllerBase.isFormEditProduct');

  @override
  bool get isFormEditProduct {
    _$isFormEditProductAtom.reportRead();
    return super.isFormEditProduct;
  }

  @override
  set isFormEditProduct(bool value) {
    _$isFormEditProductAtom.reportWrite(value, super.isFormEditProduct, () {
      super.isFormEditProduct = value;
    });
  }

  final _$isChangeScreenProductAtom =
      Atom(name: '_ProductControllerBase.isChangeScreenProduct');

  @override
  bool get isChangeScreenProduct {
    _$isChangeScreenProductAtom.reportRead();
    return super.isChangeScreenProduct;
  }

  @override
  set isChangeScreenProduct(bool value) {
    _$isChangeScreenProductAtom.reportWrite(value, super.isChangeScreenProduct,
        () {
      super.isChangeScreenProduct = value;
    });
  }

  final _$editIDProductAtom =
      Atom(name: '_ProductControllerBase.editIDProduct');

  @override
  String get editIDProduct {
    _$editIDProductAtom.reportRead();
    return super.editIDProduct;
  }

  @override
  set editIDProduct(String value) {
    _$editIDProductAtom.reportWrite(value, super.editIDProduct, () {
      super.editIDProduct = value;
    });
  }

  final _$errorAtom = Atom(name: '_ProductControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getFirstPageAsyncAction =
      AsyncAction('_ProductControllerBase.getFirstPage');

  @override
  Future getFirstPage([dynamic isFirst = false]) {
    return _$getFirstPageAsyncAction.run(() => super.getFirstPage(isFirst));
  }

  final _$swipeRefreshAsyncAction =
      AsyncAction('_ProductControllerBase.swipeRefresh');

  @override
  Future swipeRefresh() {
    return _$swipeRefreshAsyncAction.run(() => super.swipeRefresh());
  }

  final _$getNextPageAsyncAction =
      AsyncAction('_ProductControllerBase.getNextPage');

  @override
  Future getNextPage() {
    return _$getNextPageAsyncAction.run(() => super.getNextPage());
  }

  final _$onScrollAsyncAction = AsyncAction('_ProductControllerBase.onScroll');

  @override
  Future onScroll(double scrollPosition, double scrollMax) {
    return _$onScrollAsyncAction
        .run(() => super.onScroll(scrollPosition, scrollMax));
  }

  final _$excluirAsyncAction = AsyncAction('_ProductControllerBase.excluir');

  @override
  Future excluir(Product prod) {
    return _$excluirAsyncAction.run(() => super.excluir(prod));
  }

  final _$changeStatusAsyncAction =
      AsyncAction('_ProductControllerBase.changeStatus');

  @override
  Future changeStatus(Product prod) {
    return _$changeStatusAsyncAction.run(() => super.changeStatus(prod));
  }

  final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase');

  @override
  void setChangeForm() {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setChangeForm');
    try {
      return super.setChangeForm();
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChangeList() {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setChangeList');
    try {
      return super.setChangeList();
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsExpanded(String id, bool change) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.changeIsExpanded');
    try {
      return super.changeIsExpanded(id, change);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormUpdate(Product prod) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.setFormUpdate');
    try {
      return super.setFormUpdate(prod);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loadingProduct: ${loadingProduct},
isExpandedProduct: ${isExpandedProduct},
successProduct: ${successProduct},
isFormEditProduct: ${isFormEditProduct},
isChangeScreenProduct: ${isChangeScreenProduct},
editIDProduct: ${editIDProduct},
error: ${error},
newPressed: ${newPressed},
editPressed: ${editPressed}
    ''';
  }
}
