class MethodGet {
  final String response;

  MethodGet({required this.response});

  factory MethodGet.FromJson(Map<String, dynamic> json) {
    return MethodGet(response: json["hello"]);
  }
}