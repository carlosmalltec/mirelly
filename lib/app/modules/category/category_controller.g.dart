// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  Computed<bool> _$categoryNameValidComputed;

  @override
  bool get categoryNameValid => (_$categoryNameValidComputed ??= Computed<bool>(
          () => super.categoryNameValid,
          name: '_CategoryControllerBase.categoryNameValid'))
      .value;
  Computed<bool> _$categoryDescriptionValidComputed;

  @override
  bool get categoryDescriptionValid => (_$categoryDescriptionValidComputed ??=
          Computed<bool>(() => super.categoryDescriptionValid,
              name: '_CategoryControllerBase.categoryDescriptionValid'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CategoryControllerBase.isFormValid'))
          .value;
  Computed<Function> _$newPressedComputed;

  @override
  Function get newPressed =>
      (_$newPressedComputed ??= Computed<Function>(() => super.newPressed,
              name: '_CategoryControllerBase.newPressed'))
          .value;
  Computed<Function> _$editPressedComputed;

  @override
  Function get editPressed =>
      (_$editPressedComputed ??= Computed<Function>(() => super.editPressed,
              name: '_CategoryControllerBase.editPressed'))
          .value;

  final _$titleCategoryControllerAtom =
      Atom(name: '_CategoryControllerBase.titleCategoryController');

  @override
  TextEditingController get titleCategoryController {
    _$titleCategoryControllerAtom.reportRead();
    return super.titleCategoryController;
  }

  @override
  set titleCategoryController(TextEditingController value) {
    _$titleCategoryControllerAtom
        .reportWrite(value, super.titleCategoryController, () {
      super.titleCategoryController = value;
    });
  }

  final _$descriptionCategoryControllerAtom =
      Atom(name: '_CategoryControllerBase.descriptionCategoryController');

  @override
  TextEditingController get descriptionCategoryController {
    _$descriptionCategoryControllerAtom.reportRead();
    return super.descriptionCategoryController;
  }

  @override
  set descriptionCategoryController(TextEditingController value) {
    _$descriptionCategoryControllerAtom
        .reportWrite(value, super.descriptionCategoryController, () {
      super.descriptionCategoryController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoryControllerBase.isLoading');

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

  final _$loadingAtom = Atom(name: '_CategoryControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isExpandedAtom = Atom(name: '_CategoryControllerBase.isExpanded');

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  final _$successAtom = Atom(name: '_CategoryControllerBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$isFormEditAtom = Atom(name: '_CategoryControllerBase.isFormEdit');

  @override
  bool get isFormEdit {
    _$isFormEditAtom.reportRead();
    return super.isFormEdit;
  }

  @override
  set isFormEdit(bool value) {
    _$isFormEditAtom.reportWrite(value, super.isFormEdit, () {
      super.isFormEdit = value;
    });
  }

  final _$isChangeScreenAtom =
      Atom(name: '_CategoryControllerBase.isChangeScreen');

  @override
  bool get isChangeScreen {
    _$isChangeScreenAtom.reportRead();
    return super.isChangeScreen;
  }

  @override
  set isChangeScreen(bool value) {
    _$isChangeScreenAtom.reportWrite(value, super.isChangeScreen, () {
      super.isChangeScreen = value;
    });
  }

  final _$editIDAtom = Atom(name: '_CategoryControllerBase.editID');

  @override
  String get editID {
    _$editIDAtom.reportRead();
    return super.editID;
  }

  @override
  set editID(String value) {
    _$editIDAtom.reportWrite(value, super.editID, () {
      super.editID = value;
    });
  }

  final _$errorAtom = Atom(name: '_CategoryControllerBase.error');

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

  final _$categoryNameAtom = Atom(name: '_CategoryControllerBase.categoryName');

  @override
  String get categoryName {
    _$categoryNameAtom.reportRead();
    return super.categoryName;
  }

  @override
  set categoryName(String value) {
    _$categoryNameAtom.reportWrite(value, super.categoryName, () {
      super.categoryName = value;
    });
  }

  final _$categoryDescriptionAtom =
      Atom(name: '_CategoryControllerBase.categoryDescription');

  @override
  String get categoryDescription {
    _$categoryDescriptionAtom.reportRead();
    return super.categoryDescription;
  }

  @override
  set categoryDescription(String value) {
    _$categoryDescriptionAtom.reportWrite(value, super.categoryDescription, () {
      super.categoryDescription = value;
    });
  }

  final _$categoryObjectAtom =
      Atom(name: '_CategoryControllerBase.categoryObject');

  @override
  Category get categoryObject {
    _$categoryObjectAtom.reportRead();
    return super.categoryObject;
  }

  @override
  set categoryObject(Category value) {
    _$categoryObjectAtom.reportWrite(value, super.categoryObject, () {
      super.categoryObject = value;
    });
  }

  final _$getFirstPageAsyncAction =
      AsyncAction('_CategoryControllerBase.getFirstPage');

  @override
  Future getFirstPage([dynamic isFirst = false]) {
    return _$getFirstPageAsyncAction.run(() => super.getFirstPage(isFirst));
  }

  final _$swipeRefreshAsyncAction =
      AsyncAction('_CategoryControllerBase.swipeRefresh');

  @override
  Future swipeRefresh() {
    return _$swipeRefreshAsyncAction.run(() => super.swipeRefresh());
  }

  final _$getNextPageAsyncAction =
      AsyncAction('_CategoryControllerBase.getNextPage');

  @override
  Future getNextPage() {
    return _$getNextPageAsyncAction.run(() => super.getNextPage());
  }

  final _$onScrollAsyncAction = AsyncAction('_CategoryControllerBase.onScroll');

  @override
  Future onScroll(double scrollPosition, double scrollMax) {
    return _$onScrollAsyncAction
        .run(() => super.onScroll(scrollPosition, scrollMax));
  }

  final _$excluirAsyncAction = AsyncAction('_CategoryControllerBase.excluir');

  @override
  Future excluir(Category cat) {
    return _$excluirAsyncAction.run(() => super.excluir(cat));
  }

  final _$changeStatusAsyncAction =
      AsyncAction('_CategoryControllerBase.changeStatus');

  @override
  Future changeStatus(Category cat) {
    return _$changeStatusAsyncAction.run(() => super.changeStatus(cat));
  }

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  void setChangeForm() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setChangeForm');
    try {
      return super.setChangeForm();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChangeList() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setChangeList');
    try {
      return super.setChangeList();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoryDescription(dynamic value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setCategoryDescription');
    try {
      return super.setCategoryDescription(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsExpanded(String id, bool change) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.changeIsExpanded');
    try {
      return super.changeIsExpanded(id, change);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormUpdate(Category cat) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setFormUpdate');
    try {
      return super.setFormUpdate(cat);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleCategoryController: ${titleCategoryController},
descriptionCategoryController: ${descriptionCategoryController},
isLoading: ${isLoading},
loading: ${loading},
isExpanded: ${isExpanded},
success: ${success},
isFormEdit: ${isFormEdit},
isChangeScreen: ${isChangeScreen},
editID: ${editID},
error: ${error},
categoryName: ${categoryName},
categoryDescription: ${categoryDescription},
categoryObject: ${categoryObject},
categoryNameValid: ${categoryNameValid},
categoryDescriptionValid: ${categoryDescriptionValid},
isFormValid: ${isFormValid},
newPressed: ${newPressed},
editPressed: ${editPressed}
    ''';
  }
}
