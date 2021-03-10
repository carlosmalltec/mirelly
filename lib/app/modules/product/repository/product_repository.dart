import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:sistema_de_controle/app/modules/models/product.dart';
import 'package:sistema_de_controle/app/modules/repositories/parse_errors.dart';
import 'package:sistema_de_controle/app/modules/repositories/table_keys.dart';

class ProductRepository {
  Future<Product> save(Product c) async {
    final product = ParseObject(TableKeys.productTableName);
    product.set<String>(TableKeys.productTitle, c.title);
    product.set<String>(TableKeys.productDescription, c.description);

    product.set<String>(TableKeys.productDateBuy, c.dateBuy);
    product.set<String>(TableKeys.productSaleBuy, c.saleBuy.toString());
    product.set<int>(TableKeys.productQuantityBuy, c.quantityBuy);
    product.set<String>(TableKeys.productSumBuy, c.sumBuy.toString());

    product.set<int>(TableKeys.productPercent, c.percent);
    product.set<String>(TableKeys.productSales, c.sales.toString());
    product.set<int>(TableKeys.productQuantityStock, c.quantityStock);

    product.set<String>(TableKeys.productCategory, c.category);
    product.set<String>(TableKeys.productProvider, c.provider);

    product.set<int>(TableKeys.productStatus, c.status.index);
    product.set<bool>(TableKeys.productIsExpanded, c.isExpanded);

    final response = await product.save();
    if (response.success) {
      print('response => ${response}');
      return mapForProduct(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<List<Product>> findAll() async {
    final product = await ParseObject(TableKeys.productTableName).getAll();
    final List<Product> model = List<Product>();
    if (product.success) {
      for (final object in product.result) {
        model.add(mapForProduct(object));
      }
      return model;
    } else {
      return Future.error(ParseErrors.getDescription(product.error.code));
    }
  }

  Future<dynamic> excluir(Product prod) async {
    final productDelete = ParseObject(TableKeys.productTableName)..objectId = prod.id;
    final delete = await productDelete.delete();
    if (delete.success) {
      return true;
    } else {
      return Future.error(ParseErrors.getDescription(delete.error.code));
    }
  }

  Future<Product> update(String objectId, Product prod) async {
    final productUp = ParseObject(TableKeys.productTableName)..objectId = objectId;
    productUp.set<String>(TableKeys.productTitle, prod.title);
    productUp.set<String>(TableKeys.productDescription, prod.description);

    productUp.set<String>(TableKeys.productDateBuy, prod.dateBuy);
    productUp.set<String>(TableKeys.productSaleBuy, prod.saleBuy.toString());
    productUp.set<int>(TableKeys.productQuantityBuy, prod.quantityBuy);
    productUp.set<String>(TableKeys.productSumBuy, prod.sumBuy.toString());

    productUp.set<int>(TableKeys.productPercent, prod.percent);
    productUp.set<String>(TableKeys.productSales, prod.sales.toString());
    productUp.set<int>(TableKeys.productQuantityStock, prod.quantityStock);

    productUp.set<String>(TableKeys.productCategory, prod.category);
    productUp.set<String>(TableKeys.productProvider, prod.provider);

    productUp.set<int>(TableKeys.productStatus, prod.status.index);
    productUp.set<bool>(TableKeys.productIsExpanded, prod.isExpanded);

    final update = await productUp.save();

    if (update.success) {
      return mapForProduct(update.result);
    } else {
      return Future.error(ParseErrors.getDescription(update.error.code));
    }
  }

  Product mapForProduct(dataResult) {
    return Product(
      id: dataResult.objectId,
      title: dataResult.get(TableKeys.productTitle),
      description: dataResult.get(TableKeys.productDescription),
      dateBuy: dataResult.get(TableKeys.productDateBuy),
      saleBuy: double.parse(dataResult.get(TableKeys.productSaleBuy)),
      quantityBuy: dataResult.get(TableKeys.productQuantityBuy),
      sumBuy: double.parse(dataResult.get(TableKeys.productSumBuy)),
      percent: dataResult.get(TableKeys.productPercent),
      sales: double.parse(dataResult.get(TableKeys.productSales)),
      quantityStock: dataResult.get(TableKeys.productQuantityStock),
      category: dataResult.get(TableKeys.productCategory),
      provider: dataResult.get(TableKeys.productProvider),
      status: ProductStatus.values[dataResult.get(TableKeys.productStatus)],
      createdAt: dataResult.get(TableKeys.productCreatedAt),
      isExpanded: dataResult.get(TableKeys.productIsExpanded),
    );
  }
}
