import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:fly_cargo/core/network/domain/interceptors/talker_dio_interceptor.dart';
import 'package:fly_cargo/core/network/talker_service.dart';

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
    dio.interceptors.add(
      LoggerInterceptor(talker: TalkerService.instance.talker),
    );

    _talker.logInfo(
      'NetworkRepository инициализирован с базовым URL: ${ApiConfig.baseUrl}',
    );
  }
}
