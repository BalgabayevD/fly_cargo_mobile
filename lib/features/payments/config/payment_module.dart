import 'package:dio/dio.dart';
import 'package:fly_cargo/features/payments/data/sources/payment_remoute_source.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PaymentModule {
  @factoryMethod
  PaymentFlowCubit paymentFlowCubit() => PaymentFlowCubit();

  @factoryMethod
  PaymentRemoteSource providePaymentRemoteSource(
    @Named('payment-dio') Dio paymentDio,
  ) {
    return PaymentRemoteSource(paymentDio);
  }
}
