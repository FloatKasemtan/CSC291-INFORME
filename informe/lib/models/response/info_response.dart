class InfoResponse {
  final bool success = true;
  final dynamic data;
  final String message;
  final int status;

  InfoResponse(
    this.data,
    this.message, {
    this.status = 200,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) {
    return InfoResponse(json["data"], json["message"], status: json["status"]);
  }
}
