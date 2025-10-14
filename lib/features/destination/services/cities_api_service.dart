import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fly_cargo/config/api_config.dart';
import 'package:fly_cargo/config/talker_service.dart';
import 'package:fly_cargo/features/destination/models/cities_response_model.dart';
import 'package:fly_cargo/features/destination/models/cities_to_response_model.dart';
import 'package:fly_cargo/features/destination/models/city_model.dart';

class CitiesApiService {
  final Dio _dio;
  final TalkerService _talker = TalkerService.instance;

  CitiesApiService(this._dio);

  /// Обрабатывает ответ от API и конвертирует в список городов
  List<CityModel> _processApiResponse(dynamic responseData) {
    // Проверяем тип ответа
    if (responseData is String) {
      // Если ответ - строка, пытаемся распарсить как JSON
      final jsonData = responseData;
      if (jsonData.isEmpty) {
        throw Exception('Пустой ответ от сервера');
      }

      try {
        // Пытаемся распарсить строку как JSON
        final Map<String, dynamic> jsonMap = jsonDecode(jsonData);
        final citiesResponse = CitiesResponseModel.fromJson(jsonMap);
        final cities = citiesResponse.data
            .map((city) => city.toCityModel())
            .toList();

        return cities;
      } catch (e) {
        throw Exception('Не удалось распарсить JSON из строки: $e');
      }
    } else if (responseData is Map<String, dynamic>) {
      try {
        final citiesResponse = CitiesResponseModel.fromJson(responseData);
        final cities = citiesResponse.data
            .map((city) => city.toCityModel())
            .toList();
        return cities;
      } catch (e) {
        throw Exception('Ошибка парсинга JSON ответа: $e');
      }
    } else {
      throw Exception(
        'Неожиданный формат ответа от сервера: ${responseData.runtimeType}',
      );
    }
  }

  /// Загружает города для отправки
  Future<List<CityModel>> getCitiesFrom() async {
    try {
      final response = await _dio.get(ApiConfig.citiesFromUrl);

      if (response.statusCode == 200) {
        final cities = _processApiResponse(response.data);

        return cities;
      } else {
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Проблема с подключением к серверу');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      throw Exception('Неожиданная ошибка: $e');
    }
  }

  /// Загружает города для доставки
  Future<List<CityModel>> getCitiesTo({required String fromCityId}) async {
    try {
      final response = await _dio.get(
        ApiConfig.citiesToUrl,
        queryParameters: {'fromCityId': fromCityId},
      );

      if (response.statusCode == 200) {
        // Обрабатываем новый формат ответа
        final responseData = response.data as Map<String, dynamic>;

        final citiesToResponse = CitiesToResponseModel.fromJson(responseData);

        final cities = citiesToResponse.data
            .map((city) => city.toCityModel())
            .toList();

        return cities;
      } else {
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Проблема с подключением к серверу');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      throw Exception('Неожиданная ошибка: $e');
    }
  }

  /// Загружает все доступные города (объединяет from и to)
  Future<List<CityModel>> getAllCities({String? fromCityId}) async {
    try {
      final fromCities = await getCitiesFrom();
      final toCities = fromCityId != null
          ? await getCitiesTo(fromCityId: fromCityId)
          : <CityModel>[];

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

      return allCities;
    } catch (e) {
      rethrow;
    }
  }
}
