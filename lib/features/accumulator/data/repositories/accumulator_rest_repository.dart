import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';
import 'package:fly_cargo/features/accumulator/domain/repositories/accumulator_rest_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccumulatorRestRepository)
class AccumulatorRestRepositoryImpl implements AccumulatorRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  const AccumulatorRestRepositoryImpl(this.requestable, this.configuration);

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<List<AccumulatorEntity>> getAll({
    int? limit,
    int? offset,
    String? sortField,
    String? sortOrder,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;
      if (sortField != null) queryParams['sortField'] = sortField;
      if (sortOrder != null) queryParams['sortOrder'] = sortOrder;

      final response = await requestable.dio.get(
        '$_/orders/accumulator/get/all',
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      return (response.data['data'] as List).map((data) {
        return AccumulatorEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccumulatorEntity?> getById(int accumulatorId) async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/accumulator/get/by/id/$accumulatorId',
      );

      return AccumulatorEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccumulatorEntity?> getByIdentification(String identification) async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/accumulator/get/by/identification/$identification',
      );

      return AccumulatorEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccumulatorEntity?> addOrderToOpen({
    required int orderId,
    required int fromCityId,
    required int toCityId,
  }) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders/accumulator/add/open',
        data: {
          'orderId': orderId,
          'fromCityId': fromCityId,
          'toCityId': toCityId,
        },
      );

      return AccumulatorEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccumulatorEntity?> close(int accumulatorId) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders/accumulator/current/close',
        data: {
          'accumulatorId': accumulatorId,
        },
      );

      return AccumulatorEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> arrived(String identification) async {
    try {
      await requestable.dio.post(
        '$_/orders/accumulator/arrived',
        data: {
          'identification': identification,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
