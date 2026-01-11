import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentFlowCubit extends Cubit<PaymentStep> {
  PaymentFlowCubit() : super(PaymentStep.cards);

  void showCards() => emit(PaymentStep.cards);
  void showAddCard() => emit(PaymentStep.addCard);
  void showProcessing() => emit(PaymentStep.processing);
  void showSuccess() => emit(PaymentStep.success);
  void showError() => emit(PaymentStep.error);
}

enum PaymentStep {
  cards,
  addCard,
  processing,
  success,
  error,
}
