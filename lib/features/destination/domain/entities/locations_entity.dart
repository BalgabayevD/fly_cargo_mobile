import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

class LocationsEntity extends Equatable {
  final List<CityEntity> cities;

  final int? selectedCityId;
  final String? address;
  final String? floor;
  final String? entrance;
  final String? apartment;

  final double? latitude;
  final double? longitude;

  final List<String> searchQueries;

  const LocationsEntity({
    required this.cities,
    this.selectedCityId,
    this.address,
    this.floor,
    this.entrance,
    this.apartment,
    this.latitude,
    this.longitude,
    this.searchQueries = const [],
  });

  const LocationsEntity.empty() : this(cities: const <CityEntity>[]);

  @override
  List<Object?> get props => [
    cities,
    selectedCityId,
    address,
    floor,
    entrance,
    apartment,
    latitude,
    longitude,
    searchQueries,
  ];

  LocationsEntity copyWith({
    List<CityEntity>? cities,
    int? selectedCityId,
    String? address,
    String? floor,
    String? entrance,
    String? apartment,
    double? latitude,
    double? longitude,
    List<String>? searchQueries,
  }) {
    return LocationsEntity(
      cities: cities ?? this.cities,
      selectedCityId: selectedCityId ?? this.selectedCityId,
      address: address ?? this.address,
      floor: floor ?? this.floor,
      entrance: entrance ?? this.entrance,
      apartment: apartment ?? this.apartment,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      searchQueries: searchQueries ?? this.searchQueries,
    );
  }

  CityEntity? getById(int cityId) {
    final isAny = cities.any((city) => city.id == cityId);

    if (!isAny) return null;

    return cities.firstWhere((c) => c.id == cityId);
  }

  CityEntity? get city {
    if (selectedCityId != null) {
      return getById(selectedCityId!);
    }

    return null;
  }

  bool get validQuery {
    return city != null && address != null && address!.length > 3;
  }
}
