import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/destination/domain/entities/address_entity.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';

extension CityModelMapper on CityModel {
  CityEntity toEntity() {
    return CityEntity(
      id: id,
      name: name,
      region: region,
    );
  }
}

extension AddressModelMapper on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      city: city,
      address: address,
      cityId: cityId,
      fullAddress: fullAddress,
      apartment: apartment,
      entrance: entrance,
      floor: floor,
    );
  }
}

extension CityEntityMapper on CityEntity {
  CityModel toModel() {
    return CityModel(
      id: id,
      name: name,
      region: region,
    );
  }
}

extension AddressEntityMapper on AddressEntity {
  AddressModel toModel() {
    return AddressModel(
      city: city,
      address: address,
      cityId: cityId,
      fullAddress: fullAddress,
      apartment: apartment,
      entrance: entrance,
      floor: floor,
    );
  }
}
