import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentUseCase {
  final PaymentRepository paymentRepository;

  PaymentUseCase(this.paymentRepository);

  Future<String> addCard() async {
    return await paymentRepository.addCard();
  }

  Future<List<CardEntity>> getCardsList() async {
    return await paymentRepository.getCardsList();
  }

  Future<bool> deleteCard(int cardId) async {
    try {
      return await paymentRepository.deleteCard(cardId);
    } catch (_) {
      return false;
    }
  }

  Future<bool> payOrder(int paymentCardId, int orderId) async {
    try {
      return await paymentRepository.payOrder(paymentCardId, orderId);
    } catch (_) {
      return false;
    }
  }
}
