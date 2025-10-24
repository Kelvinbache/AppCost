class MethodGet {
  final String response;

  MethodGet({required this.response});

  factory MethodGet.FromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> mapJson = json['item'];
    return MethodGet(response: mapJson['response']);
  }
}