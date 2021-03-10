import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:sistema_de_controle/app/modules/models/provider_model.dart';
import 'package:sistema_de_controle/app/modules/repositories/parse_errors.dart';
import 'package:sistema_de_controle/app/modules/repositories/table_keys.dart';

class ProviderRepository {
  Future<ProviderModel> save(ProviderModel c) async {
    final provider = ParseObject(TableKeys.providerTableName);
    provider.set<String>(TableKeys.providerTitle, c.title);
    provider.set<String>(TableKeys.providerDescription, c.description);
    provider.set<int>(TableKeys.providerStatus, c.status.index);
    provider.set<bool>(TableKeys.providerIsExpanded, c.isExpanded);

    final response = await provider.save();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<List<ProviderModel>> findAll() async {
    final provider = await ParseObject(TableKeys.providerTableName).getAll();
    final List<ProviderModel> model = List<ProviderModel>();
    if (provider.success) {
      for (final object in provider.result) {
        model.add(mapParseToUser(object));
      }
      return model;
    } else {
      return Future.error(ParseErrors.getDescription(provider.error.code));
    }
  }

  Future<List<ProviderModel>> listProvider() async {
    final provider =
    await QueryBuilder(ParseObject(TableKeys.providerTableName));
    provider.whereEqualTo(TableKeys.providerStatus, ProviderStatus.ATIVO.index);
    final List<ProviderModel> model = List<ProviderModel>();
    final response = await provider.query();

    if (response.success) {
      for (final object in response.result) {
        model.add(mapParseToUser(object));
      }
      return model;
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }
  
  findAllEnable() async {
    final provider = await QueryBuilder(ParseObject(TableKeys.providerTableName));
    provider.whereEqualTo(TableKeys.providerStatus, ProviderStatus.ATIVO.index);
    final List<ProviderModel> model = List<ProviderModel>();
    final response = await provider.query();

    if (response.success) {
      for (final object in response.result) {
        print('${response.result}');
        model.add(mapParseToUser(object));
      }
      return model;
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<dynamic> excluir(ProviderModel cat) async {
    final providerDelete = ParseObject(TableKeys.providerTableName)..objectId = cat.id;
    final delete = await providerDelete.delete();

    if (delete.success) {
      return true;
    } else {
      return Future.error(ParseErrors.getDescription(delete.error.code));
    }
  }

  Future<ProviderModel> update(String objectId, ProviderModel cat) async {
    final providerUp = ParseObject(TableKeys.providerTableName)..objectId = objectId;
    providerUp.set<String>(TableKeys.providerTitle, cat.title);
    providerUp.set<String>(TableKeys.providerDescription, cat.description);
    providerUp.set<int>(TableKeys.providerStatus, cat.status.index);
    providerUp.set<bool>(TableKeys.providerIsExpanded, cat.isExpanded);

    final update = await providerUp.save();

    if (update.success) {
      return mapParseToUser(update.result);
    } else {
      return Future.error(ParseErrors.getDescription(update.error.code));
    }
  }

  ProviderModel mapParseToUser(dataResult) {
    return ProviderModel(
      id: dataResult.objectId,
      title: dataResult.get(TableKeys.providerTitle),
      description: dataResult.get(TableKeys.providerDescription),
      status: ProviderStatus.values[dataResult.get(TableKeys.providerStatus)],
      createdAt: dataResult.get(TableKeys.providerCreatedAt),
      isExpanded: dataResult.get(TableKeys.providerIsExpanded),
    );
  }
}
