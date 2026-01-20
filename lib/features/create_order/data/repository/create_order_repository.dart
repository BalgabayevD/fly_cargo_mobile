import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/create_orders_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateOrdersRestRepository)
class CreateOrdersRestRepositoryImpl implements CreateOrdersRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  const CreateOrdersRestRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<PreCreateOrderResponse> checkOrderByPhotos(
    List<String> fingerprints,
  ) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders/create/fill',
        data: {'photos': fingerprints},
      );

      return PreCreateOrderResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<double> getPrice(CreateOrderEntity data) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders/calculate/price',
        data: data.toJson(),
      );

      return response.data['data'] as double;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderEntity> createOrder(CreateOrderEntity data) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders',
        data: data.toJson(),
      );

      return OrderEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
