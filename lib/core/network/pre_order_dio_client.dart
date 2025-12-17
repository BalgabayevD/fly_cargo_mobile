import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

/// HTTP клиент для вызова /api/v1/orders/client/pre с логированием
@lazySingleton
class PreOrderDioClient {
  late final Dio _dio;

  PreOrderDioClient(
    @Named('log-interceptor') Interceptor logInterceptor,
    @Named('auth-interceptor') Interceptor authInterceptor,
  ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
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

      print('  🔄 Конвертация в JPEG: ${originalFile.path}');
      print('     Исходный размер: ${await originalFile.length()} bytes');

      // Конвертируем и сжимаем до JPEG с качеством 85%
      final result = await FlutterImageCompress.compressAndGetFile(
        originalFile.path,
        targetPath,
        quality: 85,
        format: CompressFormat.jpeg,
      );

      if (result != null) {
        final compressedFile = File(result.path);
        final compressedSize = await compressedFile.length();
        print('     Сжатый размер: $compressedSize bytes');
        print(
          '     Экономия: ${((1 - compressedSize / await originalFile.length()) * 100).toStringAsFixed(1)}%',
        );
        return compressedFile;
      } else {
        print('     ⚠️ Конвертация не удалась, используем оригинал');
        return originalFile;
      }
    } catch (e) {
      print('     ⚠️ Ошибка конвертации: $e, используем оригинал');
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

        print('  📎 Добавлен файл: $fileName');
      }

      print('📤 Отправка POST /api/v1/orders/client/pre');

      // Отправляем запрос через Dio (логирование будет автоматическим)
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/orders/client/pre',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        print('✨ Успех!');
        return response.data!;
      } else {
        throw Exception('Неожиданный ответ сервера: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('❌ Ошибка Dio: ${e.type}');

      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;

        print('🔍 Статус: $statusCode');
        print('🔍 Данные: $responseData');

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
