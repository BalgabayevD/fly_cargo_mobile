import 'package:equatable/equatable.dart';

abstract class EpaymentPayEvent extends Equatable {
  const EpaymentPayEvent();
  
  @override
  List<Object?> get props => [];
}

class EpaymentPayRequested extends EpaymentPayEvent {
  final int paymentCardId;
  final int orderId;
  
  const EpaymentPayRequested({
    required this.paymentCardId,
    required this.orderId,
  });
  
  @override
  List<Object?> get props => [paymentCardId, orderId];
}

class EpaymentPayRetry extends EpaymentPayEvent {
  const EpaymentPayRetry();
}

class EpaymentPayReset extends EpaymentPayEvent {
  const EpaymentPayReset();
}

