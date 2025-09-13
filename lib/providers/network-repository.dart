import 'package:dio/dio.dart';
import 'package:fly_cargo/config/api_config.dart';
import 'package:fly_cargo/config/talker_dio_interceptor.dart';
import 'package:fly_cargo/config/talker_service.dart';

class NetworkRepository {
  late final Dio dio;
  final TalkerService _talker = TalkerService.instance;

  NetworkRepository() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: Duration(milliseconds: ApiConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: ApiConfig.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Добавляем только Talker для логирования
    dio.interceptors.add(TalkerDioInterceptor());

    _talker.logInfo(
      'NetworkRepository инициализирован с базовым URL: ${ApiConfig.baseUrl}',
    );
  }
}
