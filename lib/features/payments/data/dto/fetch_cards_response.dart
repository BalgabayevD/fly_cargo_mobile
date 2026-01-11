class FetchCardsResponse {
  final int code;
  final List<CardData>? data;
  final String description;
  final bool success;
  FetchCardsResponse({
    required this.code,
    required this.description,
    required this.success,
    this.data,
  });

  factory FetchCardsResponse.fromJson(Map<String, dynamic> json) {
    return FetchCardsResponse(
      code: json['code'],
      data: json['data'] != null
          ? (json['data'] as List)
                .map((item) => CardData.fromJson(item))
                .toList()
          : null,
      description: json['description'],
      success: json['success'],
    );
  }
}

class CardData {
  final int id;
  final String mask;
  final String type;
  final String bank;
  final String image;

  CardData({
    required this.id,
    required this.mask,
    required this.type,
    required this.bank,
    required this.image,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'],
      mask: json['mask'],
      type: json['type'],
      bank: json['bank'],
      image: json['image'],
    );
  }
}
