class ErrorPayload {
  ErrorPayload({
    this.message,
    this.code,
  });

  String? message;
  int? code;

  factory ErrorPayload.fromJson(Map<String, dynamic> json) => ErrorPayload(
        message: json["message"],
        code: json["code"],
      );
}
