import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fly_cargo/config/talker_service.dart';

class TalkerDioInterceptor extends Interceptor {
  final TalkerService _talker = TalkerService.instance;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _talker.logInfo('🚀 HTTP REQUEST');
    _talker.logInfo('Method: ${options.method}');
    _talker.logInfo('URL: ${options.uri}');
    if (options.headers.isNotEmpty) {
      _talker.logInfo('Headers: ${options.headers}');
    }
    if (options.data != null) {
      _logFormattedData('Request Data', options.data);
    }
    if (options.queryParameters.isNotEmpty) {
      _talker.logInfo('Query Parameters: ${options.queryParameters}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _talker.logInfo('✅ HTTP RESPONSE');
    _talker.logInfo('Status Code: ${response.statusCode}');
    _talker.logInfo('URL: ${response.requestOptions.uri}');
    if (response.headers.map.isNotEmpty) {
      _talker.logInfo('Response Headers: ${response.headers.map}');
    }
    if (response.data != null) {
      _logFormattedData('Response Data', response.data);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _talker.logError('❌ HTTP ERROR');
    _talker.logError('Method: ${err.requestOptions.method}');
    _talker.logError('URL: ${err.requestOptions.uri}');
    _talker.logError('Status Code: ${err.response?.statusCode}');
    _talker.logError('Error: ${err.message}');
    if (err.response?.data != null) {
      _logFormattedData('Response Data', err.response?.data);
    }
    super.onError(err, handler);
  }

  void _logFormattedData(String label, dynamic data) {
    try {
      String formattedData;
      if (data is String) {
        // Если это строка, пытаемся распарсить как JSON
        try {
          final jsonData = jsonDecode(data);
          formattedData = const JsonEncoder.withIndent('  ').convert(jsonData);
        } catch (e) {
          // Если не JSON, выводим как есть
          formattedData = data;
        }
      } else if (data is Map || data is List) {
        // Если это Map или List, форматируем как JSON
        formattedData = const JsonEncoder.withIndent('  ').convert(data);
      } else {
        // Для других типов выводим как есть
        formattedData = data.toString();
      }

      // Логируем весь JSON в одном блоке
      _talker.logInfo('$label:\n$formattedData');
    } catch (e) {
      // Если что-то пошло не так, выводим как есть
      _talker.logInfo('$label: ${data.toString()}');
    }
  }
}
