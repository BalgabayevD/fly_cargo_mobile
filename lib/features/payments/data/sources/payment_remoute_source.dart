import 'package:dio/dio.dart';
import 'package:fly_cargo/features/payments/data/dto/add_card_response.dart';
import 'package:fly_cargo/features/payments/data/dto/fetch_cards_response.dart';
import 'package:fly_cargo/features/payments/data/dto/pay_order_request.dart';
import 'package:fly_cargo/features/payments/data/dto/pay_order_response.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_remoute_source.g.dart';

@RestApi()
abstract class PaymentRemoteSource {
  factory PaymentRemoteSource(Dio dio, {String baseUrl}) = _PaymentRemoteSource;
  @GET('/payments/form/page')
  Future<AddCardResponse> addCard();
  @GET('/payment/cards')
  Future<FetchCardsResponse> fetchCards();
  @POST('/orders/pay')
  Future<PayOrderResponse> payOrder(@Body() PayOrderRequest request);
}
