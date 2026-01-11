class PayOrderResponse {
  final int code;
  final dynamic data;
  final String description;
  final bool success;

  PayOrderResponse({
    required this.code,
    required this.description,
    required this.success,
    this.data,
  });

  factory PayOrderResponse.fromJson(Map<String, dynamic> json) {
    return PayOrderResponse(
      code: json['code'] as int,
      data: json['data'],
      description: json['description'] as String,
      success: json['success'] as bool,
    );
  }
}
