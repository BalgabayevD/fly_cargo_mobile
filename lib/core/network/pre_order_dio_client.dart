import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class PreOrderDioClient {
  late final Dio _dio;

  PreOrderDioClient(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
    ApiConfig apiConfig,
  ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 420),
        receiveTimeout: const Duration(seconds: 420),
        sendTimeout: const Duration(seconds: 420),
      ),
    );

    // Добавляем interceptors: сначала auth, потом log
    _dio.interceptors.addAll([authInterceptor, logInterceptor]);

    // Настройка для игнорирования сертификатов (только для разработки)
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }

  /// Конвертирует изображение в JPEG с сжатием
  Future<File> _convertToJpeg(File originalFile) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = originalFile.uri.pathSegments.last.split('.').first;
      final targetPath = '${tempDir.path}/${fileName}_compressed.jpg';

      // Конвертируем и сжимаем до JPEG с качеством 85%
      final result = await FlutterImageCompress.compressAndGetFile(
        originalFile.path,
        targetPath,
        quality: 85,
        format: CompressFormat.jpeg,
      );

      if (result != null) {
        return File(result.path);
      } else {
        return originalFile;
      }
    } catch (e) {
      return originalFile;
    }
  }

  /// Выполняет POST запрос на /api/v1/orders/client/pre
  /// Принимает список файлов вместо FormData
  Future<Map<String, dynamic>> postPreOrder(List<File> files) async {
    try {
      // Создаем FormData для multipart/form-data запроса
      final formData = FormData();

      // Конвертируем и добавляем файлы
      for (var file in files) {
        // Конвертируем изображение в JPEG
        final jpegFile = await _convertToJpeg(file);
        final fileName = jpegFile.uri.pathSegments.last;

        final multipartFile = await MultipartFile.fromFile(
          jpegFile.path,
          filename: fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')
              ? fileName
              : '${fileName.split('.').first}.jpg',
        );

        formData.files.add(MapEntry('file', multipartFile));
      }

      // Отправляем запрос через Dio (логирование будет автоматическим)
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/orders/client/pre',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data!;
      } else {
        throw Exception('Неожиданный ответ сервера: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;

        // Пытаемся извлечь детали ошибки
        if (responseData is Map<String, dynamic>) {
          final description = responseData['description'] ?? 'Unknown error';
          throw Exception('Ошибка сервера ($statusCode): $description');
        }

        throw Exception('Ошибка сервера: $statusCode');
      }

      throw Exception('Ошибка сети: ${e.message}');
    }
  }
}
