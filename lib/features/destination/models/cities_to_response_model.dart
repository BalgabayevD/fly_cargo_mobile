import 'package:fly_cargo/features/destination/models/api_city_model.dart';

class CitiesToResponseModel {
  final FromCityData fromCity;
  final List<ApiCityModel> cities;
  final int total;

  const CitiesToResponseModel({
    required this.fromCity,
    required this.cities,
    required this.total,
  });

  factory CitiesToResponseModel.fromJson(Map<String, dynamic> json) {
    return CitiesToResponseModel(
      fromCity: FromCityData.fromJson(json['fromCity'] as Map<String, dynamic>),
      cities: (json['cities'] as List<dynamic>)
          .map((city) => ApiCityModel.fromJson(city as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromCity': fromCity.toJson(),
      'cities': cities.map((city) => city.toJson()).toList(),
      'total': total,
    };
  }
}

class FromCityData {
  final int id;
  final String name;
  final String country;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final List<dynamic>? routesFrom;
  final List<dynamic>? routesTo;

  const FromCityData({
    required this.id,
    required this.name,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.routesFrom,
    this.routesTo,
  });

  factory FromCityData.fromJson(Map<String, dynamic> json) {
    return FromCityData(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      routesFrom: json['RoutesFrom'] as List<dynamic>?,
      routesTo: json['RoutesTo'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'RoutesFrom': routesFrom,
      'RoutesTo': routesTo,
    };
  }
}
