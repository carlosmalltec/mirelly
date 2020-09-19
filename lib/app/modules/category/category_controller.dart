import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/category/repository/category_repository.dart';
import 'package:sistema_de_controle/app/modules/models/category.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';
part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store, Disposable {
  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  ObservableList<Category> listData = ObservableList<Category>();

  ObservableMap<String, bool> isExpandedMap = ObservableMap<String, bool>();

  @observable
  LoadingStatus isLoading = LoadingStatus.notLoading;

  @observable
  bool loading = false;

  @observable
  bool isExpanded = false;

  @observable
  bool success = false;

  @observable
  bool isFormEdit = false;

  @observable
  bool isChangeScreen = false;

  @observable
  String editID = '';

  static const _loadMorePageConst = 0.9;

  bool _canLoadOnScroll = false;

  @action
  void setChangeForm() => isChangeScreen = true;

  @action
  void setChangeList() => isChangeScreen = false;

  @observable
  String error;

  @observable
  String categoryName;

  @action
  void setName(value) => categoryName = value;

  @computed
  bool get categoryNameValid => categoryName != null && categoryName.length > 4;
  String get nameError {
    if (categoryName == null || categoryNameValid) {
      return null;
    } else if (categoryName.isEmpty) {
      return 'Nome obrigatório';
    } else {
      return 'Informe nome da categoria';
    }
  }

  @observable
  String categoryDescription;

  @action
  void setCategoryDescription(value) => categoryDescription = value;

  @computed
  bool get categoryDescriptionValid =>
      categoryDescription != null && categoryDescription.length > 4;
  String get categoryDescriptionError {
    if (categoryDescription == null || categoryDescriptionValid) {
      return null;
    } else if (categoryDescription.isEmpty) {
      return 'Nome obrigatório';
    } else {
      return 'Informe nome da categoria';
    }
  }

  @computed
  bool get isFormValid => categoryNameValid && categoryDescriptionValid;

  @computed
  Function get newPressed => (isFormValid && !loading) ? _newCategory : null;

  @computed
  Function get editPressed =>
      (isFormValid && !loading && isFormEdit) ? _saveEdit : null;

  @action
  getFirstPage([isFirst = false]) async {
    if (isFirst) {
      isLoading = LoadingStatus.shimmerLoading;
    } else {
      isLoading = LoadingStatus.fullLoading;
    }
    listData.clear();
    await _findAll();
  }

  @action
  swipeRefresh() async {
    isLoading = LoadingStatus.shimmerLoading;
    listData.clear();
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
      final response = await CategoryRepository().findAll();
      if (clearList) listData.clear();
      if (response != null) {
        response.asMap().forEach((key, value) {
          isExpandedMap[value.id] = value.isExpanded;
        });
        listData.addAll(response);
      }
      isLoading = LoadingStatus.notLoading;
      _canLoadOnScroll = true;
    } catch (e) {}
  }

  @action
  changeIsExpanded(String id, bool change) {
    isExpanded = true;
    isExpandedMap[id] = !isExpandedMap[id];
    isExpanded = false;
  }

  @action
  excluir(Category cat) async {
    listData.remove(cat);
    final delete = await CategoryRepository().excluir(cat);
  }

  @action
  setFormUpdate(Category cat) {
    isChangeScreen = true; //form
    isFormEdit = true; //habilita mais campos
    titleController.text = cat.title;
    descriptionController.text = cat.description;
    categoryName = cat.title;
    categoryDescription = cat.description;
    editID = cat.id;
    listData.remove(cat);
  }

  @action
  changeStatus(Category cat) async {
    final Category data = Category(
      id: cat.id,
      title: cat.title,
      description: cat.description,
      status: cat.status != CategoryStatus.ATIVO
          ? CategoryStatus.ATIVO
          : CategoryStatus.INATIVO,
      isExpanded: false,
    );
    listData.remove(cat);
    listData.insert(0, data);
    editID = cat.id;
    final update = await CategoryRepository().update(editID, data);
  }

  _saveEdit() async {
    loading = true;
    success = false;
    error = null;
    final Category data = Category(
      title: categoryName,
      description: categoryDescription,
      status: CategoryStatus.ATIVO,
      isExpanded: false,
    );
    final update = await CategoryRepository().update(editID, data);
    listData.insert(0, update);
    loading = false;
    isFormEdit = false;
    success = true;
    error = 'Alteração com sucesso!';
    _isEmpaty();
    await Future.delayed(Duration(seconds: 3));
    success = false;
    error = null;
  }

  _newCategory() async {
    loading = true;
    success = false;
    error = null;
    final Category data = Category(
      title: categoryName,
      description: categoryDescription,
      status: CategoryStatus.ATIVO,
      isExpanded: false,
    );
    try {
      final response = await CategoryRepository().save(data);
      isExpandedMap[response.id] = response.isExpanded;
      listData.insert(0, response);
      loading = false;
      success = true;
      error = 'Seu cadastro foi realizado com sucesso!';
      _isEmpaty();
      await Future.delayed(Duration(seconds: 3));
      success = false;
      error = null;
    } catch (e) {
      error = e;
      loading = false;
    }
  }

  _isEmpaty() {
    descriptionController.clear();
    titleController.clear();
    categoryDescription = null;
    categoryName = null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }
}
