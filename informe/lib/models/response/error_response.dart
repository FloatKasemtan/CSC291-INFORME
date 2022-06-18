class ErrorResponse {
  final bool success = false;
  final String message;
  final int status;

  ErrorResponse(this.message, this.status);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(json["message"], json["status"]);
  }
}
