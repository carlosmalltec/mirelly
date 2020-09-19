// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProvidersController on _ProvidersControllerBase, Store {
  Computed<bool> _$providerNameValidComputed;

  @override
  bool get providerNameValid => (_$providerNameValidComputed ??= Computed<bool>(
          () => super.providerNameValid,
          name: '_ProvidersControllerBase.providerNameValid'))
      .value;
  Computed<bool> _$providerDescriptionValidComputed;

  @override
  bool get providerDescriptionValid => (_$providerDescriptionValidComputed ??=
          Computed<bool>(() => super.providerDescriptionValid,
              name: '_ProvidersControllerBase.providerDescriptionValid'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ProvidersControllerBase.isFormValid'))
          .value;
  Computed<Function> _$newPressedComputed;

  @override
  Function get newPressed =>
      (_$newPressedComputed ??= Computed<Function>(() => super.newPressed,
              name: '_ProvidersControllerBase.newPressed'))
          .value;
  Computed<Function> _$editPressedComputed;

  @override
  Function get editPressed =>
      (_$editPressedComputed ??= Computed<Function>(() => super.editPressed,
              name: '_ProvidersControllerBase.editPressed'))
          .value;

  final _$titleControllerAtom =
      Atom(name: '_ProvidersControllerBase.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$descriptionControllerAtom =
      Atom(name: '_ProvidersControllerBase.descriptionController');

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProvidersControllerBase.isLoading');

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

  final _$loadingProviderAtom =
      Atom(name: '_ProvidersControllerBase.loadingProvider');

  @override
  bool get loadingProvider {
    _$loadingProviderAtom.reportRead();
    return super.loadingProvider;
  }

  @override
  set loadingProvider(bool value) {
    _$loadingProviderAtom.reportWrite(value, super.loadingProvider, () {
      super.loadingProvider = value;
    });
  }

  final _$isExpandedProviderAtom =
      Atom(name: '_ProvidersControllerBase.isExpandedProvider');

  @override
  bool get isExpandedProvider {
    _$isExpandedProviderAtom.reportRead();
    return super.isExpandedProvider;
  }

  @override
  set isExpandedProvider(bool value) {
    _$isExpandedProviderAtom.reportWrite(value, super.isExpandedProvider, () {
      super.isExpandedProvider = value;
    });
  }

  final _$successProviderAtom =
      Atom(name: '_ProvidersControllerBase.successProvider');

  @override
  bool get successProvider {
    _$successProviderAtom.reportRead();
    return super.successProvider;
  }

  @override
  set successProvider(bool value) {
    _$successProviderAtom.reportWrite(value, super.successProvider, () {
      super.successProvider = value;
    });
  }

  final _$isFormEditProviderAtom =
      Atom(name: '_ProvidersControllerBase.isFormEditProvider');

  @override
  bool get isFormEditProvider {
    _$isFormEditProviderAtom.reportRead();
    return super.isFormEditProvider;
  }

  @override
  set isFormEditProvider(bool value) {
    _$isFormEditProviderAtom.reportWrite(value, super.isFormEditProvider, () {
      super.isFormEditProvider = value;
    });
  }

  final _$isChangeScreenProviderAtom =
      Atom(name: '_ProvidersControllerBase.isChangeScreenProvider');

  @override
  bool get isChangeScreenProvider {
    _$isChangeScreenProviderAtom.reportRead();
    return super.isChangeScreenProvider;
  }

  @override
  set isChangeScreenProvider(bool value) {
    _$isChangeScreenProviderAtom
        .reportWrite(value, super.isChangeScreenProvider, () {
      super.isChangeScreenProvider = value;
    });
  }

  final _$editIDProviderAtom =
      Atom(name: '_ProvidersControllerBase.editIDProvider');

  @override
  String get editIDProvider {
    _$editIDProviderAtom.reportRead();
    return super.editIDProvider;
  }

  @override
  set editIDProvider(String value) {
    _$editIDProviderAtom.reportWrite(value, super.editIDProvider, () {
      super.editIDProvider = value;
    });
  }

  final _$errorAtom = Atom(name: '_ProvidersControllerBase.error');

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

  final _$providerNameAtom =
      Atom(name: '_ProvidersControllerBase.providerName');

  @override
  String get providerName {
    _$providerNameAtom.reportRead();
    return super.providerName;
  }

  @override
  set providerName(String value) {
    _$providerNameAtom.reportWrite(value, super.providerName, () {
      super.providerName = value;
    });
  }

  final _$providerDescriptionAtom =
      Atom(name: '_ProvidersControllerBase.providerDescription');

  @override
  String get providerDescription {
    _$providerDescriptionAtom.reportRead();
    return super.providerDescription;
  }

  @override
  set providerDescription(String value) {
    _$providerDescriptionAtom.reportWrite(value, super.providerDescription, () {
      super.providerDescription = value;
    });
  }

  final _$getFirstPageAsyncAction =
      AsyncAction('_ProvidersControllerBase.getFirstPage');

  @override
  Future getFirstPage([dynamic isFirst = false]) {
    return _$getFirstPageAsyncAction.run(() => super.getFirstPage(isFirst));
  }

  final _$swipeRefreshAsyncAction =
      AsyncAction('_ProvidersControllerBase.swipeRefresh');

  @override
  Future swipeRefresh() {
    return _$swipeRefreshAsyncAction.run(() => super.swipeRefresh());
  }

  final _$getNextPageAsyncAction =
      AsyncAction('_ProvidersControllerBase.getNextPage');

  @override
  Future getNextPage() {
    return _$getNextPageAsyncAction.run(() => super.getNextPage());
  }

  final _$onScrollAsyncAction =
      AsyncAction('_ProvidersControllerBase.onScroll');

  @override
  Future onScroll(double scrollPosition, double scrollMax) {
    return _$onScrollAsyncAction
        .run(() => super.onScroll(scrollPosition, scrollMax));
  }

  final _$excluirAsyncAction = AsyncAction('_ProvidersControllerBase.excluir');

  @override
  Future excluir(ProviderModel cat) {
    return _$excluirAsyncAction.run(() => super.excluir(cat));
  }

  final _$changeStatusAsyncAction =
      AsyncAction('_ProvidersControllerBase.changeStatus');

  @override
  Future changeStatus(ProviderModel cat) {
    return _$changeStatusAsyncAction.run(() => super.changeStatus(cat));
  }

  final _$_ProvidersControllerBaseActionController =
      ActionController(name: '_ProvidersControllerBase');

  @override
  void setChangeForm() {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.setChangeForm');
    try {
      return super.setChangeForm();
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChangeList() {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.setChangeList');
    try {
      return super.setChangeList();
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProviderDescription(dynamic value) {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.setProviderDescription');
    try {
      return super.setProviderDescription(value);
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsExpanded(String id, bool change) {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.changeIsExpanded');
    try {
      return super.changeIsExpanded(id, change);
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormUpdate(ProviderModel cat) {
    final _$actionInfo = _$_ProvidersControllerBaseActionController.startAction(
        name: '_ProvidersControllerBase.setFormUpdate');
    try {
      return super.setFormUpdate(cat);
    } finally {
      _$_ProvidersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
descriptionController: ${descriptionController},
isLoading: ${isLoading},
loadingProvider: ${loadingProvider},
isExpandedProvider: ${isExpandedProvider},
successProvider: ${successProvider},
isFormEditProvider: ${isFormEditProvider},
isChangeScreenProvider: ${isChangeScreenProvider},
editIDProvider: ${editIDProvider},
error: ${error},
providerName: ${providerName},
providerDescription: ${providerDescription},
providerNameValid: ${providerNameValid},
providerDescriptionValid: ${providerDescriptionValid},
isFormValid: ${isFormValid},
newPressed: ${newPressed},
editPressed: ${editPressed}
    ''';
  }
}
