import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fly_cargo/core/network/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Минималистичный HTTP клиент только для вызова /api/v1/orders/client/pre
@lazySingleton
class PreOrderDioClient {
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
    // Получаем токен из SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth-token');

    print('🔑 Token присутствует: ${token != null && token.isNotEmpty}');

    // Создаем HttpClient с настройками для тестирования
    final httpClient = HttpClient()
      ..badCertificateCallback = (cert, host, port) {
        print('⚠️ Ignoring bad certificate for $host:$port');
        return true; // ВРЕМЕННО игнорируем проблемы с сертификатом
      }
      ..connectionTimeout = const Duration(seconds: 420);

    final ioClient = IOClient(httpClient);

    try {
      // Создаем multipart request
      final uri = Uri.parse('${ApiConfig.baseUrl}/api/v1/orders/client/pre');
      final request = http.MultipartRequest('POST', uri);

      // Добавляем ТОЛЬКО Authorization header (минимум)
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      print('🔍 Минимальные заголовки - только Authorization');

      // Конвертируем и добавляем файлы
      for (var file in files) {
        // Конвертируем изображение в JPEG
        final jpegFile = await _convertToJpeg(file);
        final fileName = jpegFile.uri.pathSegments.last;
        final fileBytes = await jpegFile.readAsBytes();

        request.files.add(
          http.MultipartFile.fromBytes(
            'file',
            fileBytes,
            filename: fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')
                ? fileName
                : '${fileName.split('.').first}.jpg',
            // Автоматически определится как image/jpeg
          ),
        );

        print('  📎 Добавлен файл: $fileName (${fileBytes.length} bytes)');
      }

      print('📤 Отправка POST /api/v1/orders/client/pre');
      print('🔍 Headers: ${request.headers}');
      print('🔍 Files count: ${request.files.length}');
      for (var file in request.files) {
        print(
          '   - ${file.field}: ${file.filename} (${file.length} bytes, ${file.contentType})',
        );
      }
      print('🔍 Content-Type будет установлен автоматически с boundary');

      // Отправляем запрос через IOClient
      final streamedResponse = await ioClient
          .send(request)
          .timeout(
            const Duration(seconds: 420),
          );

      // Получаем ответ
      final response = await http.Response.fromStream(streamedResponse);

      print('📊 Статус: ${response.statusCode}');
      print('📥 Response Headers: ${response.headers}');
      print('📄 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('✨ Успех!');
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return jsonData;
      } else {
        print('❌ Ошибка HTTP: ${response.statusCode}');

        // Пытаемся распарсить JSON для детальной ошибки
        try {
          final errorData = json.decode(response.body) as Map<String, dynamic>;
          print('🔍 Детали ошибки: $errorData');
          final code = errorData['code'];
          final description = errorData['description'] ?? 'Unknown error';
          final success = errorData['success'];
          print('   Code: $code');
          print('   Description: $description');
          print('   Success: $success');

          throw Exception(
            'Ошибка сервера (${response.statusCode}): $description',
          );
        } catch (e) {
          print('⚠️ Не удалось распарсить ошибку: $e');
          throw Exception(
            'Ошибка сервера: ${response.statusCode}, body: ${response.body}',
          );
        }
      }
    } finally {
      ioClient.close();
    }
  }
}
