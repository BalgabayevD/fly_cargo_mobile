import 'package:fly_cargo/features/destination/models/address_model.dart';

class OrderData {
  final dynamic box;
  final AddressModel fromAddress;
  final AddressModel toAddress;
  final Map<String, String>? recipientData;
  final String? cargoDescription;
  final List<String>? photos;

  const OrderData({
    required this.box,
    required this.fromAddress,
    required this.toAddress,
    this.recipientData,
    this.cargoDescription,
    this.photos,
  });

  OrderData copyWith({
    dynamic box,
    AddressModel? fromAddress,
    AddressModel? toAddress,
    Map<String, String>? recipientData,
    String? cargoDescription,
    List<String>? photos,
  }) {
    return OrderData(
      box: box ?? this.box,
      fromAddress: fromAddress ?? this.fromAddress,
      toAddress: toAddress ?? this.toAddress,
      recipientData: recipientData ?? this.recipientData,
      cargoDescription: cargoDescription ?? this.cargoDescription,
      photos: photos ?? this.photos,
    );
  }
}
