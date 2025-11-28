import 'order_model.dart';

class OrderResult {
  final int orderId;
  final String status;
  final String message;

  const OrderResult({
    required this.orderId,
    required this.status,
    required this.message,
  });

  factory OrderResult.fromOrderModel(OrderModel order) {
    return OrderResult(
      orderId: order.id,
      status: 'created',
      message: 'Заказ успешно создан',
    );
  }
}

