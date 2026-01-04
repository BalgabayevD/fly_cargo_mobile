import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/payments/domain/usecases/pay_order_usecase.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_event.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class EpaymentPayBloc extends Bloc<EpaymentPayEvent, EpaymentPayState> {
  final PayOrderUseCase _payOrderUseCase;
  
  EpaymentPayBloc(this._payOrderUseCase) : super(const EpaymentPayInitial()) {
    on<EpaymentPayRequested>(_onPayRequested);
    on<EpaymentPayRetry>(_onPayRetry);
    on<EpaymentPayReset>(_onPayReset);
  }
  
  Future<void> _onPayRequested(
    EpaymentPayRequested event,
    Emitter<EpaymentPayState> emit,
  ) async {
    emit(const EpaymentPayProcessing());
    try {
      final success = await _payOrderUseCase(
        paymentCardId: event.paymentCardId,
        orderId: event.orderId,
      );
      
      if (success) {
        emit(const EpaymentPaySuccess());
      } else {
        emit(
          EpaymentPayError(
            message: 'Не удалось выполнить оплату',
            paymentCardId: event.paymentCardId,
            orderId: event.orderId,
          ),
        );
      }
    } catch (e) {
      emit(
        EpaymentPayError(
          message: 'Ошибка при оплате: ${e.toString()}',
          paymentCardId: event.paymentCardId,
          orderId: event.orderId,
        ),
      );
    }
  }
  
  Future<void> _onPayRetry(
    EpaymentPayRetry event,
    Emitter<EpaymentPayState> emit,
  ) async {
    final currentState = state;
    if (currentState is EpaymentPayError) {
      if (currentState.paymentCardId != null && currentState.orderId != null) {
        add(
          EpaymentPayRequested(
            paymentCardId: currentState.paymentCardId!,
            orderId: currentState.orderId!,
          ),
        );
      }
    }
  }
  
  Future<void> _onPayReset(
    EpaymentPayReset event,
    Emitter<EpaymentPayState> emit,
  ) async {
    emit(const EpaymentPayInitial());
  }
}

