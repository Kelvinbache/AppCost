
class MethodGet {
  final String product;
  final String cost;

  MethodGet({required this.product, required this.cost});

  factory MethodGet.FromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> mapJson = json['item'];
    return MethodGet(product: mapJson['product'], cost: mapJson['cost']);
  }
}