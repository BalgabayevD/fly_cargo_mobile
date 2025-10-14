import 'package:injectable/injectable.dart';

@singleton
class ApiConfig {
  // Базовый URL для API
  static const String baseUrl = 'https://user-cargo.maguya.kz';

  // Endpoints для городов (только пути, без baseUrl)
  static const String citiesFromEndpoint = '/api/v1/directions/cities/from';
  static const String citiesToEndpoint = '/api/v1/directions/cities/to';

  // Endpoint для поиска адресов
  static const String addressesEndpoint = '/api/v1/maps/cities/list';

  // Таймауты
  static const int connectTimeout = 30000; // 30 секунд
  static const int receiveTimeout = 30000; // 30 секунд

  // Только endpoints (baseUrl добавляется автоматически в Dio)
  static String get citiesFromUrl => citiesFromEndpoint;
  static String get citiesToUrl => citiesToEndpoint;
  static String get addressesUrl => addressesEndpoint;
}
