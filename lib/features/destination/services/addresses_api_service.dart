import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fly_cargo/config/api_config.dart';
import 'package:fly_cargo/config/talker_service.dart';
import 'package:fly_cargo/features/destination/models/address_suggestion_model.dart';

class AddressesApiService {
  final Dio _dio;
  final TalkerService _talker = TalkerService.instance;

  AddressesApiService(this._dio);

  /// Поиск адресов по городу и запросу
  Future<List<AddressSuggestionModel>> searchAddresses({
    required String city,
    required String address,
  }) async {
    _talker.logInfo('Поиск адресов: город="$city", адрес="$address"');

    try {
      final response = await _dio.get(
        ApiConfig.addressesUrl,
        queryParameters: {'city': city, 'address': address},
      );

      if (response.statusCode == 200) {
        // Проверяем тип данных и парсим JSON
        Map<String, dynamic> responseData;
        if (response.data is Map<String, dynamic>) {
          responseData = response.data as Map<String, dynamic>;
        } else if (response.data is Map) {
          responseData = Map<String, dynamic>.from(response.data as Map);
        } else if (response.data is String) {
          // Если данные приходят как строка, парсим JSON
          try {
            responseData =
                jsonDecode(response.data as String) as Map<String, dynamic>;
          } catch (e) {
            _talker.logError('Ошибка парсинга JSON: $e');
            throw Exception('Ошибка парсинга JSON: $e');
          }
        } else {
          _talker.logError(
            'Неожиданный тип данных: ${response.data.runtimeType}',
          );
          throw Exception('Неожиданный формат ответа от сервера');
        }

        final suggestionsResponse = AddressSuggestionsResponseModel.fromJson(
          responseData,
        );
        _talker.logInfo('Найдено ${suggestionsResponse.data.length} адресов');
        return suggestionsResponse.data;
      } else {
        _talker.logError(
          'Ошибка поиска адресов. Статус: ${response.statusCode}',
        );
        throw Exception('Failed to search addresses: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        _talker.logError('Таймаут при поиске адресов');
        throw Exception('Проблема с подключением к серверу');
      } else if (e.type == DioExceptionType.badResponse) {
        _talker.logError(
          'Ошибка сервера при поиске адресов: ${e.response?.statusCode}',
        );
        throw Exception('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        _talker.logError('Ошибка сети при поиске адресов: ${e.message}');
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      _talker.logError('Неожиданная ошибка при поиске адресов: $e');
      throw Exception('Неожиданная ошибка: $e');
    }
  }
}
