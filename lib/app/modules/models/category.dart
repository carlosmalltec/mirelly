enum CategoryStatus{INATIVO,ATIVO,PENDENTE}
class Category{
  final String id;
  final String title;
  final String description;
  final bool isExpanded;
  final CategoryStatus status;
  final DateTime createdAt;

  Category({this.id, this.title, this.description, this.status, this.createdAt, this.isExpanded = false});

  @override
  String toString() {
    return 'Category{id: $id, title: $title, description: $description, status: $status, createdAt: $createdAt, isExpanded: $isExpanded}';
  }
}