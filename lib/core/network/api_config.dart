import 'package:injectable/injectable.dart';

@singleton
class ApiConfig {
  String get baseUrl => 'https://user-cargo.maguya.kz';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
