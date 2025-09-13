class CityRouteModel {
  final String createdAt;
  final String fromCity;
  final int fromCityId;
  final int id;
  final bool isActive;
  final String toCity;
  final int toCityId;
  final String updatedAt;

  const CityRouteModel({
    required this.createdAt,
    required this.fromCity,
    required this.fromCityId,
    required this.id,
    required this.isActive,
    required this.toCity,
    required this.toCityId,
    required this.updatedAt,
  });

  factory CityRouteModel.fromJson(Map<String, dynamic> json) {
    return CityRouteModel(
      createdAt: json['createdAt'] as String,
      fromCity: json['fromCity'] as String,
      fromCityId: json['fromCityId'] as int,
      id: json['id'] as int,
      isActive: json['isActive'] as bool,
      toCity: json['toCity'] as String,
      toCityId: json['toCityId'] as int,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'fromCity': fromCity,
      'fromCityId': fromCityId,
      'id': id,
      'isActive': isActive,
      'toCity': toCity,
      'toCityId': toCityId,
      'updatedAt': updatedAt,
    };
  }
}
