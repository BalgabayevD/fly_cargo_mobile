import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;
  final String? name;

  const Location({
    required this.latitude,
    required this.longitude,
    this.address,
    this.name,
  });

  @override
  List<Object?> get props => [latitude, longitude, address, name];

  Location copyWith({
    double? latitude,
    double? longitude,
    String? address,
    String? name,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      name: name ?? this.name,
    );
  }
}
