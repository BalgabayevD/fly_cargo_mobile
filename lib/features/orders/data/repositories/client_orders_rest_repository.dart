import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/orders/domain/repositories/client_orders_rest_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ClientOrdersRestRepository)
class ClientOrdersRestRepositoryImpl implements ClientOrdersRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  const ClientOrdersRestRepositoryImpl(this.requestable, this.configuration);

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
  Future<List<OrderEntity>> getOrders() async {
    try {
      final response = await requestable.dio.get(
        '$_/orders/client',
      );

      return (response.data['data'] as List).map((data) {
        return OrderEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
