import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';

abstract class PaymentRepository {
  Future<String> addCard();
  Future<List<CardEntity>> getCardsList();
  Future<bool> payOrder(
    int paymentCardId,
    int orderId,
  );
}
