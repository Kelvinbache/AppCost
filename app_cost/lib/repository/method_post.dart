
class MethodPost {
  final String response;

  MethodPost({required this.response});

  factory MethodPost.FromJson(Map<String, dynamic> json) {
    return MethodPost(response: json["data"]);
  }
}
