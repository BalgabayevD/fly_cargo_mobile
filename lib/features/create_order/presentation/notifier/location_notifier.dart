import 'package:flutter/foundation.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';

class LocationNotifier extends ChangeNotifier {
  LocationsEntity locations;

  LocationNotifier({LocationsEntity? locations})
    : locations = locations ?? LocationsEntity.empty();

  void selectCity(int cityId) {
    locations = locations.copyWith(selectedCityId: cityId);
    locations.searchQueries.clear();
    notifyListeners();
  }

  void setApartment(String apartment) {
    locations = locations.copyWith(apartment: apartment);
    notifyListeners();
  }

  void setAddress(String address) {
    locations = locations.copyWith(address: address);
    notifyListeners();
  }

  void setLocations(LocationsEntity value) {
    locations = value;
    notifyListeners();
  }
}
