import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fly_cargo/config/api_config.dart';
import 'package:fly_cargo/config/talker_service.dart';
import 'package:fly_cargo/features/destination/models/cities_response_model.dart';
import 'package:fly_cargo/features/destination/models/city_model.dart';

class CitiesApiService {
  final Dio _dio;
  final TalkerService _talker = TalkerService.instance;

  CitiesApiService(this._dio);

  /// Обрабатывает ответ от API и конвертирует в список городов
  List<CityModel> _processApiResponse(dynamic responseData) {
    _talker.logDebug(
      'Обработка ответа от API. Тип данных: ${responseData.runtimeType}',
    );

    // Проверяем тип ответа
    if (responseData is String) {
      // Если ответ - строка, пытаемся распарсить как JSON
      final jsonData = responseData;
      if (jsonData.isEmpty) {
        _talker.logError('Получен пустой ответ от сервера');
        throw Exception('Пустой ответ от сервера');
      }

      try {
        // Пытаемся распарсить строку как JSON
        final Map<String, dynamic> jsonMap = jsonDecode(jsonData);
        final citiesResponse = CitiesResponseModel.fromJson(jsonMap);
        final cities = citiesResponse.data
            .map((city) => city.toCityModel())
            .toList();
        _talker.logInfo(
          'Успешно обработано ${cities.length} городов из строкового ответа',
        );
        return cities;
      } catch (e) {
        _talker.logError('Ошибка парсинга JSON из строки: $e');
        throw Exception('Не удалось распарсить JSON из строки: $e');
      }
    } else if (responseData is Map<String, dynamic>) {
      try {
        final citiesResponse = CitiesResponseModel.fromJson(responseData);
        final cities = citiesResponse.data
            .map((city) => city.toCityModel())
            .toList();
        _talker.logInfo(
          'Успешно обработано ${cities.length} городов из JSON ответа',
        );
        return cities;
      } catch (e) {
        _talker.logError('Ошибка парсинга JSON ответа: $e');
        throw Exception('Ошибка парсинга JSON ответа: $e');
      }
    } else {
      _talker.logError(
        'Неожиданный формат ответа от сервера: ${responseData.runtimeType}',
      );
      throw Exception(
        'Неожиданный формат ответа от сервера: ${responseData.runtimeType}',
      );
    }
  }

  /// Загружает города для отправки
  Future<List<CityModel>> getCitiesFrom() async {
    _talker.logInfo('Запрос городов для отправки: ${ApiConfig.citiesFromUrl}');

    try {
      final response = await _dio.get(ApiConfig.citiesFromUrl);

      if (response.statusCode == 200) {
        final cities = _processApiResponse(response.data);
        _talker.logInfo(
          'Успешно загружено ${cities.length} городов для отправки',
        );
        return cities;
      } else {
        _talker.logError(
          'Ошибка загрузки городов для отправки. Статус: ${response.statusCode}',
        );
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        _talker.logError('Таймаут при загрузке городов для отправки');
        throw Exception('Проблема с подключением к серверу');
      } else if (e.type == DioExceptionType.badResponse) {
        _talker.logError(
          'Ошибка сервера при загрузке городов для отправки: ${e.response?.statusCode}',
        );
        throw Exception('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        _talker.logError(
          'Ошибка сети при загрузке городов для отправки: ${e.message}',
        );
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      _talker.logError(
        'Неожиданная ошибка при загрузке городов для отправки: $e',
      );
      throw Exception('Неожиданная ошибка: $e');
    }
  }

  /// Загружает города для доставки
  Future<List<CityModel>> getCitiesTo() async {
    _talker.logInfo('Запрос городов для доставки: ${ApiConfig.citiesToUrl}');

    try {
      final response = await _dio.get(ApiConfig.citiesToUrl);

      if (response.statusCode == 200) {
        final cities = _processApiResponse(response.data);
        _talker.logInfo(
          'Успешно загружено ${cities.length} городов для доставки',
        );
        return cities;
      } else {
        _talker.logError(
          'Ошибка загрузки городов для доставки. Статус: ${response.statusCode}',
        );
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        _talker.logError('Таймаут при загрузке городов для доставки');
        throw Exception('Проблема с подключением к серверу');
      } else if (e.type == DioExceptionType.badResponse) {
        _talker.logError(
          'Ошибка сервера при загрузке городов для доставки: ${e.response?.statusCode}',
        );
        throw Exception('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        _talker.logError(
          'Ошибка сети при загрузке городов для доставки: ${e.message}',
        );
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      _talker.logError(
        'Неожиданная ошибка при загрузке городов для доставки: $e',
      );
      throw Exception('Неожиданная ошибка: $e');
    }
  }

  /// Загружает все доступные города (объединяет from и to)
  Future<List<CityModel>> getAllCities() async {
    _talker.logInfo('Запрос всех доступных городов (объединение from и to)');

    try {
      final fromCities = await getCitiesFrom();
      final toCities = await getCitiesTo();

      _talker.logDebug(
        'Загружено ${fromCities.length} городов для отправки и ${toCities.length} городов для доставки',
      );

      // Объединяем списки и убираем дубликаты по ID
      final allCities = <CityModel>[];
      final addedIds = <String>{};

      for (final city in [...fromCities, ...toCities]) {
        if (!addedIds.contains(city.id)) {
          allCities.add(city);
          addedIds.add(city.id);
        }
      }

      // Сортируем по названию
      allCities.sort((a, b) => a.name.compareTo(b.name));

      _talker.logInfo(
        'Успешно объединено ${allCities.length} уникальных городов',
      );
      return allCities;
    } catch (e) {
      _talker.logError('Ошибка при загрузке всех городов: $e');
      rethrow;
    }
  }
}
