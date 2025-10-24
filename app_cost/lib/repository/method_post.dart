
class MethodPost {
  final String product;
  final String cost;


  MethodPost({required this.product, required this.cost});

  factory MethodPost.FromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> mapJson = json['data'];

    return MethodPost(product: mapJson["product"], cost: mapJson["cost"]);
  }
}
