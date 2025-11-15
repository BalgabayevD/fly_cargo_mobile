import 'package:json_annotation/json_annotation.dart';
part 'destination_models.g.dart';
@JsonSerializable()
class CitiesFromResponse {
  final List<ApiCityModel> data;
  const CitiesFromResponse({required this.data});
  factory CitiesFromResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesFromResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CitiesFromResponseToJson(this);
}
@JsonSerializable()
class CitiesToResponse {
  final List<ApiCityModel> data;
  const CitiesToResponse({required this.data});
  factory CitiesToResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesToResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CitiesToResponseToJson(this);
}
@JsonSerializable()
class ApiCityModel {
  @JsonKey(fromJson: _idFromJson)
  final String id;
  final String name;
  final String? region;
  const ApiCityModel({required this.id, required this.name, this.region});
  factory ApiCityModel.fromJson(Map<String, dynamic> json) =>
      _$ApiCityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiCityModelToJson(this);
  static String _idFromJson(dynamic value) {
    if (value is int) {
      return value.toString();
    }
    return value.toString();
  }
  CityModel toCityModel() {
    return CityModel(id: id, name: name, region: region);
  }
}
@JsonSerializable()
class AddressSuggestionsResponse {
  final List<AddressSuggestionModel>? data;
  const AddressSuggestionsResponse({this.data});
  factory AddressSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddressSuggestionsResponseToJson(this);
}
@JsonSerializable()
class AddressSuggestionModel {
  final String title;
  const AddressSuggestionModel({required this.title});
  factory AddressSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressSuggestionModelToJson(this);
  AddressModel toAddressModel() {
    return AddressModel(
      city: '',
      address: title,
      cityId: '',
      fullAddress: title,
    );
  }
}
class CityModel {
  final String id;
  final String name;
  final String? region;
  const CityModel({required this.id, required this.name, this.region});
  String get displayName {
    if (region != null) {
      return '$name, $region';
    }
    return name;
  }
  CityModel copyWith({String? id, String? name, String? region}) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CityModel &&
        other.id == id &&
        other.name == name &&
        other.region == region;
  }
  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ region.hashCode;
  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, region: $region)';
  }
}
class AddressModel {
  final String city;
  final String address;
  final String? fullAddress;
  final String cityId;
  const AddressModel({
    required this.city,
    required this.address,
    required this.cityId,
    this.fullAddress,
  });
  String get displayText {
    if (fullAddress != null) {
      return fullAddress!;
    }
    return '$city, $address';
  }
  AddressModel copyWith({
    String? city,
    String? address,
    String? cityId,
    String? fullAddress,
  }) {
    return AddressModel(
      city: city ?? this.city,
      address: address ?? this.address,
      cityId: cityId ?? this.cityId,
      fullAddress: fullAddress ?? this.fullAddress,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddressModel &&
        other.city == city &&
        other.address == address &&
        other.cityId == cityId &&
        other.fullAddress == fullAddress;
  }
  @override
  int get hashCode =>
      city.hashCode ^ address.hashCode ^ cityId.hashCode ^ fullAddress.hashCode;
  @override
  String toString() {
    return 'AddressModel(city: $city, address: $address, cityId: $cityId, fullAddress: $fullAddress)';
  }
}
