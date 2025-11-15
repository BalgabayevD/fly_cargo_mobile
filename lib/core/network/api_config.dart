import 'package:injectable/injectable.dart';
@singleton
class ApiConfig {
  static const String baseUrl = 'https://user-cargo.maguya.kz';
  static const String addressesEndpoint = '/api/v1/maps/cities/list';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static String get addressesUrl => addressesEndpoint;
}
