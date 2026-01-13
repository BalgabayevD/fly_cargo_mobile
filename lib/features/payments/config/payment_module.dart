import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/payments/data/sources/payment_remoute_source.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PaymentModule {
  @factoryMethod
  PaymentFlowCubit paymentFlowCubit() => PaymentFlowCubit();

  @factoryMethod
  PaymentRemoteSource providePaymentRemoteSource(
    Requestable requestable,
  ) {
    return PaymentRemoteSource(requestable.dio);
  }
}
