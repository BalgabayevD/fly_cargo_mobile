import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CalculateOrderPriceUseCase {
  final OrdersRepository _ordersRepository;

  CalculateOrderPriceUseCase(this._ordersRepository);

  Future<PriceCalculationModel> call({
    required int tariffId,
    required int fromCityId,
    required int toCityId,
    required String toPhone,
  }) async {
    try {
      if (tariffId <= 0) {
        throw ArgumentError('ID тарифа должен быть больше 0');
      }
      if (fromCityId <= 0) {
        throw ArgumentError('ID города отправки должен быть больше 0');
      }
      if (toCityId <= 0) {
        throw ArgumentError('ID города доставки должен быть больше 0');
      }
      if (toPhone.isEmpty) {
        throw ArgumentError('Номер телефона получателя обязателен');
      }
      return await _ordersRepository.calculateOrderPrice(
        tariffId: tariffId,
        fromCityId: fromCityId,
        toCityId: toCityId,
        toPhone: toPhone,
      );
    } catch (e) {
      throw OrdersUseCaseException('Ошибка при расчете стоимости: $e');
    }
  }
}

class OrdersUseCaseException implements Exception {
  final String message;
  const OrdersUseCaseException(this.message);

  @override
  String toString() => 'OrdersUseCaseException: $message';
}
