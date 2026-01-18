import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';

abstract class CreateOrdersRestRepository {
  Future<PreCreateOrderResponse> checkOrderByPhotos(List<String> fingerprints);
}
