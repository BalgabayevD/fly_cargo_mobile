import 'package:equatable/equatable.dart';

abstract class EpaymentPayState extends Equatable {
  const EpaymentPayState();
  
  @override
  List<Object?> get props => [];
}

class EpaymentPayInitial extends EpaymentPayState {
  const EpaymentPayInitial();
}

class EpaymentPayProcessing extends EpaymentPayState {
  const EpaymentPayProcessing();
}

class EpaymentPaySuccess extends EpaymentPayState {
  const EpaymentPaySuccess();
}

class EpaymentPayError extends EpaymentPayState {
  final String message;
  final int? paymentCardId;
  final int? orderId;
  
  const EpaymentPayError({
    required this.message,
    this.paymentCardId,
    this.orderId,
  });
  
  @override
  List<Object?> get props => [message, paymentCardId, orderId];
}

