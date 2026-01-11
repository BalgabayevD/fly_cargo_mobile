import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PayOrderUseCase {
  final PaymentRepository _paymentRepository;

  PayOrderUseCase(this._paymentRepository);

  Future<bool> call({
    required int paymentCardId,
    required int orderId,
  }) async {
    if (orderId <= 0) {
      throw ArgumentError('ID заказа должен быть положительным числом');
    }
    if (paymentCardId <= 0) {
      throw ArgumentError('ID карты должен быть положительным числом');
    }
    
    return await _paymentRepository.payOrder(
      paymentCardId: paymentCardId,
      orderId: orderId,
    );
  }
}

