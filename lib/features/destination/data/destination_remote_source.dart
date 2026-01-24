import 'package:dio/dio.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart';

part 'destination_remote_source.g.dart';

abstract class DestinationRemoteSource {
  factory DestinationRemoteSource(Dio dio, {String baseUrl}) =
      _DestinationRemoteSource;
  Future<CitiesFromResponse> getCitiesFrom();
  Future<CitiesToResponse> getCitiesTo(String fromCityId);
  Future<AddressSuggestionsResponse> searchAddresses(
    String city,
    String address,
  );
}
