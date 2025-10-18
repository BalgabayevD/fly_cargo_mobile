import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:retrofit/retrofit.dart';

part 'destination_remote_source.g.dart';

@RestApi()
abstract class DestinationRemoteSource {
  factory DestinationRemoteSource(Dio dio, {String baseUrl}) =
      _DestinationRemoteSource;

  @GET('/api/v1/directions/cities/from')
  Future<CitiesFromResponse> getCitiesFrom();

  @GET('/api/v1/directions/cities/to')
  Future<CitiesToResponse> getCitiesTo(@Query('fromCityId') String fromCityId);

  @GET('/api/v1/maps/cities/list')
  Future<AddressSuggestionsResponse> searchAddresses(
    @Query('city') String city,
    @Query('address') String address,
  );
}
