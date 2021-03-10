enum ProductStatus{INATIVO,ATIVO,PENDENTE}
class Product{
  final String id;
  final String title;
  final String description;

  final double saleBuy;
  final String dateBuy;
  final int quantityBuy;
  final double sumBuy;
  final int percent;

  final double sales;
  final int quantityStock;
  final String category;
  final String provider;

  final bool isExpanded;
  final ProductStatus status;
  final DateTime createdAt;

  Product({this.id,
    this.title,
    this.dateBuy,
    this.description,
    this.saleBuy,
    this.quantityBuy,
    this.sumBuy,
    this.percent,
    this.sales,
    this.quantityStock,
    this.category,
    this.provider,
    this.isExpanded,
    this.status,
    this.createdAt});

  @override
  String toString() {
    return 'Product{id: $id, title: $title, description: $description, saleBuy: $saleBuy, dateBuy: $dateBuy, quantityBuy: $quantityBuy, sumBuy: $sumBuy, percent: $percent, sales: $sales, quantityStock: $quantityStock, category: $category, provider: $provider, isExpanded: $isExpanded, status: $status, createdAt: $createdAt}';
  }
}