import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/create_orders_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateOrdersRestRepository)
class CreateOrdersRestRepositoryImpl implements CreateOrdersRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  const CreateOrdersRestRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  // String get _order => configuration.environmentVariables.orderBaseUrl;
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
}
