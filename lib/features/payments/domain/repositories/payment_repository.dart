import 'package:fly_cargo/features/payments/domain/entities/card.dart';

abstract class PaymentRepository {
  Future<String> addCard();
  Future<List<Card>> fetchCards();
  Future<bool> payOrder({
    required int paymentCardId,
    required int orderId,
  });
}

