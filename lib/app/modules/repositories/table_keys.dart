
class TableKeys {
  TableKeys._();

  static const String userId = "objectId";
  static const String userName = "name";
  static const String userContact = "contact";
  static const String userMail = "email";
  static const String userType = 'userType';
  static const String userCreatedAt = 'createdAt';

  // category

  static const String categoryTableName = "Categorys";
  static const String categoryId = "objectId";
  static const String categoryTitle = "title";
  static const String categoryDescription = "description";
  static const String categoryStatus = 'status';
  static const String categoryCreatedAt = 'createdAt';
  static const String categoryIsExpanded = 'isExpanded';

    // provider

  static const String providerTableName = "Providers";
  static const String providerId = "objectId";
  static const String providerTitle = "title";
  static const String providerDescription = "description";
  static const String providerStatus = 'status';
  static const String providerCreatedAt = 'createdAt';
  static const String providerIsExpanded = 'isExpanded';

      // product

  static const String productTableName = "Products";
  static const String productId = "objectId";
  static const String productTitle = "title";
  static const String productDescription = "description";
  static const String productStatus = 'status';

  static const String productDateBuy = 'dateBuy'; //data da compra
  static const String productSaleBuy = 'saleBuy'; //valor da compra
  static const String productQuantityBuy = 'quantityBuy'; //quantidade
  static const String productSumBuy = 'sumBuy'; //soma total quantidade * valor

  static const String productPercent = 'percent'; //margem de lucro
  static const String productSales = 'sales'; //valor de venda
  static const String productQuantityStock = 'quantityStock'; //Quantidade em estoque

  static const String productCategory = 'category'; //Category
  static const String productProvider = 'provider'; //fornecedor

  static const String productCreatedAt = 'createdAt';
  static const String productIsExpanded = 'isExpanded';

}