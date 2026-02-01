import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/orders/domain/repositories/courier_orders_rest_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/decline_order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/submit_order_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CourierOrdersRestRepository)
class CourierOrdersRestRepositoryImpl implements CourierOrdersRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  const CourierOrdersRestRepositoryImpl(this.requestable, this.configuration);

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<OrderEntity?> getOrderById(int orderId) async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/by/orderId/$orderId',
      );

      return OrderEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderEntity?> getOrderByIdentification(String identification) async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/by/barcode/$identification',
      );

      return OrderEntity.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/courier',
      );

      return (response.data['data'] as List).map((data) {
        return OrderEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderEntity>> getOpenOrders() async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/created',
      );

      return (response.data['data'] as List).map((data) {
        return OrderEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> accept(
    int orderId,
    int courierArriveTime,
  ) async {
    try {
      await requestable.dio.post(
        '$_/orders/courier/accept',
        data: {
          'orderId': orderId,
          'courierArriveTime': courierArriveTime,
        },
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> submit(SubmitOrderEntity data) async {
    try {
      await requestable.dio.post(
        '$_/orders/courier/submit',
        data: data.toJson(),
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> decline(DeclineOrderEntity data) async {
    try {
      await requestable.dio.post(
        '$_/orders/courier/decline',
        data: data.toJson(),
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> identify(int orderId, String identification) async {
    try {
      await requestable.dio.post(
        '$_/orders/courier/identification/add',
        data: {
          'orderId': orderId,
          'barcode': identification,
        },
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
