import 'package:fly_cargo/features/destination/models/city_model.dart';
import 'package:fly_cargo/features/destination/models/city_route_model.dart';

class ApiCityModel {
  final String country;
  final String createdAt;
  final int id;
  final String name;
  final List<CityRouteModel>? routesFrom;
  final List<CityRouteModel>? routesTo;
  final String updatedAt;
  final String? deletedAt;

  const ApiCityModel({
    required this.country,
    required this.createdAt,
    required this.id,
    required this.name,
    this.routesFrom,
    this.routesTo,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ApiCityModel.fromJson(Map<String, dynamic> json) {
    return ApiCityModel(
      country: json['country'] as String,
      createdAt: json['createdAt'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      routesFrom: json['RoutesFrom'] != null
          ? (json['RoutesFrom'] as List<dynamic>)
                .map(
                  (route) =>
                      CityRouteModel.fromJson(route as Map<String, dynamic>),
                )
                .toList()
          : null,
      routesTo: json['RoutesTo'] != null
          ? (json['RoutesTo'] as List<dynamic>)
                .map(
                  (route) =>
                      CityRouteModel.fromJson(route as Map<String, dynamic>),
                )
                .toList()
          : null,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'createdAt': createdAt,
      'id': id,
      'name': name,
      'RoutesFrom': routesFrom?.map((route) => route.toJson()).toList(),
      'RoutesTo': routesTo?.map((route) => route.toJson()).toList(),
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  // Конвертация в CityModel для использования в UI
  CityModel toCityModel() {
    return CityModel(id: id.toString(), name: name, region: country);
  }
}
