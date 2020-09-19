import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/models/provider_model.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';

import 'repository/provider_repository.dart';

part 'providers_controller.g.dart';

class ProvidersController = _ProvidersControllerBase with _$ProvidersController;

abstract class _ProvidersControllerBase with Store ,Disposable{
  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  ObservableList<ProviderModel> listDataProvider = ObservableList<ProviderModel>();

  ObservableMap<String, bool> isExpandedMapProvider = ObservableMap<String, bool>();

  @observable
  LoadingStatus isLoading = LoadingStatus.notLoading;

  @observable
  bool loadingProvider = false;

  @observable
  bool isExpandedProvider = false;

  @observable
  bool successProvider = false;

  @observable
  bool isFormEditProvider = false;

  @observable
  bool isChangeScreenProvider = false;

  @observable
  String editIDProvider = '';

  static const _loadMorePageConst = 0.9;

  bool _canLoadOnScroll = false;

  @action
  void setChangeForm() => isChangeScreenProvider = true;

  @action
  void setChangeList() => isChangeScreenProvider = false;

  @observable
  String error;

  @observable
  String providerName;

  @action
  void setName(value) => providerName = value;

  @computed
  bool get providerNameValid => providerName != null && providerName.length > 4;
  String get nameError {
    if (providerName == null || providerNameValid) {
      return null;
    } else if (providerName.isEmpty) {
      return 'Nome obrigatório';
    } else {
      return 'Informe nome da categoria';
    }
  }

  @observable
  String providerDescription;

  @action
  void setProviderDescription(value) => providerDescription = value;

  @computed
  bool get providerDescriptionValid =>
      providerDescription != null && providerDescription.length > 4;
  String get providerDescriptionError {
    if (providerDescription == null || providerDescriptionValid) {
      return null;
    } else if (providerDescription.isEmpty) {
      return 'Nome obrigatório';
    } else {
      return 'Informe nome da categoria';
    }
  }

  @computed
  bool get isFormValid => providerNameValid && providerDescriptionValid;

  @computed
  Function get newPressed => (isFormValid && !loadingProvider) ? _newProvider : null;

  @computed
  Function get editPressed =>
      (isFormValid && !loadingProvider && isFormEditProvider) ? _saveEdit : null;

  @action
  getFirstPage([isFirst = false]) async {
    if (isFirst) {
      isLoading = LoadingStatus.shimmerLoading;
    } else {
      isLoading = LoadingStatus.fullLoading;
    }
    listDataProvider.clear();
    await _findAll();
  }

  @action
  swipeRefresh() async {
    isLoading = LoadingStatus.shimmerLoading;
    listDataProvider.clear();
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
      final response = await ProviderRepository().findAll();
      if (clearList) listDataProvider.clear();
      if (response != null) {
        response.asMap().forEach((key, value) {
          isExpandedMapProvider[value.id] = value.isExpanded;
        });
        listDataProvider.addAll(response);
      }
      isLoading = LoadingStatus.notLoading;
      _canLoadOnScroll = true;
    } catch (e) {}
  }

  @action
  changeIsExpanded(String id, bool change) {
    isExpandedProvider = true;
    isExpandedMapProvider[id] = !isExpandedMapProvider[id];
    isExpandedProvider = false;
  }

  @action
  excluir(ProviderModel cat) async {
    listDataProvider.remove(cat);
    final delete = await ProviderRepository().excluir(cat);
  }

  @action
  setFormUpdate(ProviderModel cat) {
    isChangeScreenProvider = true; //form
    isFormEditProvider = true; //habilita mais campos
    titleController.text = cat.title;
    descriptionController.text = cat.description;
    providerName = cat.title;
    providerDescription = cat.description;
    editIDProvider = cat.id;
    listDataProvider.remove(cat);
  }

  @action
  changeStatus(ProviderModel cat) async {
    final ProviderModel data = ProviderModel(
      id: cat.id,
      title: cat.title,
      description: cat.description,
      status: cat.status != ProviderStatus.ATIVO
          ? ProviderStatus.ATIVO
          : ProviderStatus.INATIVO,
      isExpanded: false,
    );
    listDataProvider.remove(cat);
    listDataProvider.insert(0, data);
    editIDProvider = cat.id;
    final update = await ProviderRepository().update(editIDProvider, data);
  }

  _saveEdit() async {
    loadingProvider = true;
    successProvider = false;
    error = null;
    final ProviderModel data = ProviderModel(
      title: providerName,
      description: providerDescription,
      status: ProviderStatus.ATIVO,
      isExpanded: false,
    );
    final update = await ProviderRepository().update(editIDProvider, data);
    listDataProvider.insert(0, update);
    loadingProvider = false;
    isFormEditProvider = false;
    successProvider = true;
    error = 'Alteração com sucesso!';
    _isEmpaty();
    await Future.delayed(Duration(seconds: 3));
    successProvider = false;
    error = null;
  }

  _newProvider() async {
    loadingProvider = true;
    successProvider = false;
    error = null;
    final ProviderModel data = ProviderModel(
      title: providerName,
      description: providerDescription,
      status: ProviderStatus.ATIVO,
      isExpanded: false,
    );
    try {
      final response = await ProviderRepository().save(data);
      isExpandedMapProvider[response.id] = response.isExpanded;
      listDataProvider.insert(0, response);
      loadingProvider = false;
      successProvider = true;
      error = 'Seu cadastro foi realizado com sucesso!';
      _isEmpaty();
      await Future.delayed(Duration(seconds: 3));
      successProvider = false;
      error = null;
    } catch (e) {
      error = e;
      loadingProvider = false;
    }
  }

  _isEmpaty() {
    descriptionController.clear();
    titleController.clear();
    providerDescription = null;
    providerName = null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }
}
