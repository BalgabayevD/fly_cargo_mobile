class PayOrderRequest {
  final int paymentCardId;
  final int orderId;

  PayOrderRequest({
    required this.paymentCardId,
    required this.orderId,
  });

  Map<String, dynamic> toJson() => {
        'paymentCardId': paymentCardId,
        'orderId': orderId,
      };

}