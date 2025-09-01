import 'package:equatable/equatable.dart';

class Cargo extends Equatable {
  final String id;
  final String title;
  final String description;
  final double weight;
  final double volume;
  final String fromLocation;
  final String toLocation;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final double price;
  final String status;
  final String userId;

  const Cargo({
    required this.id,
    required this.title,
    required this.description,
    required this.weight,
    required this.volume,
    required this.fromLocation,
    required this.toLocation,
    required this.departureDate,
    required this.arrivalDate,
    required this.price,
    required this.status,
    required this.userId,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    weight,
    volume,
    fromLocation,
    toLocation,
    departureDate,
    arrivalDate,
    price,
    status,
    userId,
  ];
}
