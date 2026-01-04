class AddCardResponse {
  final int code;
  final String data;
  final String description;
  final bool success;

  AddCardResponse({
    required this.code,
    required this.data,
    required this.description,
    required this.success,
  });

  factory AddCardResponse.fromJson(Map<String, dynamic> json) {
    return AddCardResponse(
      code: json['code'] as int,
      data: json['data'] as String,
      description: json['description'] as String,
      success: json['success'] as bool,
    );
  }
}