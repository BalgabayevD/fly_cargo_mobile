import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/create_orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateOrdersUseCase {
  final CreateOrdersRestRepository createOrdersRest;

  const CreateOrdersUseCase(this.createOrdersRest);

  Future<PreCreateOrderResult?> checkOrderByPhotos(
    List<String> fingerprints,
  ) async {
    try {
      final response = await createOrdersRest.checkOrderByPhotos(fingerprints);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
