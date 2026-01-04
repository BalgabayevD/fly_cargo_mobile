import 'package:injectable/injectable.dart';

@singleton
class ApiConfig {
  String get baseUrl => 'https://user-cargo.maguya.kz';
  String get gatewayBaseUrl => 'https://gateway.maguya.kz';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
