import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class CreateOrdersRestRepository {
  Future<PreCreateOrderResponse> checkOrderByPhotos(List<String> fingerprints);
  Future<OrderEntity> createOrder(CreateOrderEntity data);
  Future<double> getPrice(CreateOrderEntity data);
}
