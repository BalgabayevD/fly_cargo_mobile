import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/payments/domain/entities/card_entity.dart';
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final Requestable requestable;
  final Configuration configuration;

  PaymentRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<String> addCard() async {
    try {
      final response = await requestable.dio.get(
        '$_/payments/form/page',
      );

      return response.data['data'] as String;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CardEntity>> getCardsList() async {
    try {
      final response = await requestable.dio.get(
        '$_/payment/cards',
      );

      return (response.data['data'] as List).map((data) {
        return CardEntity.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> payOrder(int paymentCardId, int orderId) async {
    try {
      final response = await requestable.dio.post(
        '$_/orders/pay',
      );

      return response.data['data'] as bool;
    } catch (e) {
      rethrow;
    }
  }
}
