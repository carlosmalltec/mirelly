import 'package:sistema_de_controle/app/modules/models/category.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:sistema_de_controle/app/modules/repositories/parse_errors.dart';
import 'package:sistema_de_controle/app/modules/repositories/table_keys.dart';

class CategoryRepository {
  Future<Category> save(Category c) async {
    final category = ParseObject(TableKeys.categoryTableName);
    category.set<String>(TableKeys.categoryTitle, c.title);
    category.set<String>(TableKeys.categoryDescription, c.description);
    category.set<int>(TableKeys.categoryStatus, c.status.index);
    category.set<bool>(TableKeys.categoryIsExpanded, c.isExpanded);

    final response = await category.save();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<List<Category>> findAll() async {
    final category = await ParseObject(TableKeys.categoryTableName).getAll();
    final List<Category> model = List<Category>();
    if (category.success) {
      for (final object in category.result) {
        model.add(mapParseToUser(object));
      }
      return model;
    } else {
      return Future.error(ParseErrors.getDescription(category.error.code));
    }
  }

  Future<dynamic> excluir(Category cat) async {
    final categoryDelete = ParseObject(TableKeys.categoryTableName)..objectId = cat.id;
    final delete = await categoryDelete.delete();

    if (delete.success) {
      return true;
    } else {
      return Future.error(ParseErrors.getDescription(delete.error.code));
    }
  }

  Future<Category> update(String objectId, Category cat) async {
    final categoryUp = ParseObject(TableKeys.categoryTableName)..objectId = objectId;
    categoryUp.set<String>(TableKeys.categoryTitle, cat.title);
    categoryUp.set<String>(TableKeys.categoryDescription, cat.description);
    categoryUp.set<int>(TableKeys.categoryStatus, cat.status.index);
    categoryUp.set<bool>(TableKeys.categoryIsExpanded, cat.isExpanded);

    final update = await categoryUp.save();

    if (update.success) {
      return mapParseToUser(update.result);
    } else {
      return Future.error(ParseErrors.getDescription(update.error.code));
    }
  }

  Category mapParseToUser(dataResult) {
    return Category(
      id: dataResult.objectId,
      title: dataResult.get(TableKeys.categoryTitle),
      description: dataResult.get(TableKeys.categoryDescription),
      status: CategoryStatus.values[dataResult.get(TableKeys.categoryStatus)],
      createdAt: dataResult.get(TableKeys.categoryCreatedAt),
      isExpanded: dataResult.get(TableKeys.categoryIsExpanded),
    );
  }
}
