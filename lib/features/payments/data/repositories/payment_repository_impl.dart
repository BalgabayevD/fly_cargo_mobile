import 'package:fly_cargo/features/payments/data/dto/pay_order_request.dart';
import 'package:fly_cargo/features/payments/data/sources/payment_remoute_source.dart';
import 'package:fly_cargo/features/payments/domain/entities/card.dart';
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteSource _remoteSource;

  PaymentRepositoryImpl(this._remoteSource);

  @override
  Future<String> addCard() async {
    try {
      final response = await _remoteSource.addCard();
      if (!response.success) {
        throw PaymentException(response.description);
      }
      return response.data;
    } catch (e) {
      throw PaymentException('Ошибка при добавлении карты: $e');
    }
  }

  @override
  Future<List<Card>> fetchCards() async {
    try {
      final response = await _remoteSource.fetchCards();
      if (!response.success) {
        throw PaymentException(response.description);
      }
      
      // Если data null или пустой - возвращаем пустой список
      if (response.data == null || response.data!.isEmpty) {
        return [];
      }
      
      return response.data!.map((cardData) {
        return Card(
          id: cardData.id,
          mask: cardData.mask,
          type: cardData.type,
          bank: cardData.bank,
          image: cardData.image,
        );
      }).toList();
    } catch (e) {
      throw PaymentException('Ошибка при получении карт: $e');
    }
  }

  @override
  Future<bool> payOrder({
    required int paymentCardId,
    required int orderId,
  }) async {
    try {
      final response = await _remoteSource.payOrder(
        PayOrderRequest(
          paymentCardId: paymentCardId,
          orderId: orderId,
        ),
      );
      if (!response.success) {
        throw PaymentException(response.description);
      }
      return response.success;
    } catch (e) {
      throw PaymentException('Ошибка при оплате заказа: $e');
    }
  }
}

class PaymentException implements Exception {
  final String message;
  const PaymentException(this.message);
  
  @override
  String toString() => 'PaymentException: $message';
}

