class ResponseApi {
  final int statusCode;
  final dynamic message;
  dynamic data;

  ResponseApi({
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    return ResponseApi(
      statusCode: json['status'] as int,
      message: json['messages'] as dynamic,
      data: json['data'] as dynamic,
    );
  }
}
