import 'package:dio/dio.dart';
import 'package:fly_cargo/client/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/shared/orders/data/models/file_upload_models.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_remote_source.g.dart';

@RestApi()
abstract class OrdersRemoteSource {
  factory OrdersRemoteSource(Dio dio, {String baseUrl}) = _OrdersRemoteSource;
  @POST('/api/v1/orders')
  Future<CreateOrderResponse> createOrder(@Body() CreateOrderRequest request);

  @POST('/api/v1/orders/client/pre')
  @MultiPart()
  Future<PreCreateOrderResult> createOrderPre(
    @Part(name: 'file') List<MultipartFile> files,
  );

  @POST('/api/v1/orders/price')
  Future<CalculateOrderPriceResponse> calculateOrderPrice(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/v1/order/photo/upload')
  @MultiPart()
  Future<FileUploadResponse> uploadOrderPhoto(@Part() MultipartFile file);

  @GET('/api/v1/orders/client')
  Future<OrdersResponse> getClientOrders();

  @GET('/api/v1/orders/courier')
  Future<OrdersResponse> getCourierOrders();

  @GET('/api/v1/orders/created')
  Future<OrdersResponse> getCreatedOrders();

  @GET('/api/v1/orders/by/id/{orderId}')
  Future<OrderDetailResponse> getOrderById(@Path('orderId') String orderId);
}
