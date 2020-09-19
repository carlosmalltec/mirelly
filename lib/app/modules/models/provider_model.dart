enum ProviderStatus{INATIVO,ATIVO,PENDENTE}
class ProviderModel{
  final String id;
  final String title;
  final String description;
  final bool isExpanded;
  final ProviderStatus status;
  final DateTime createdAt;

  ProviderModel({this.id, this.title, this.description, this.status, this.createdAt, this.isExpanded = false});

  @override
  String toString() {
    return 'Provider{id: $id, title: $title, description: $description, status: $status, createdAt: $createdAt, isExpanded: $isExpanded}';
  }
}