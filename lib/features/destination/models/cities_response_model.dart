import 'package:fly_cargo/features/destination/models/api_city_model.dart';

class CitiesResponseModel {
  final List<ApiCityModel> data;

  const CitiesResponseModel({
    required this.data,
  });

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) {
    return CitiesResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((city) => ApiCityModel.fromJson(city as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((city) => city.toJson()).toList(),
    };
  }
}
