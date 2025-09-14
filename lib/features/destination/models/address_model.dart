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
