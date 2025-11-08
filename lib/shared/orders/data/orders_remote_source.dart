import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/orders/data/models/file_upload_models.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_remote_source.g.dart';

@RestApi()
abstract class OrdersRemoteSource {
  factory OrdersRemoteSource(Dio dio, {String baseUrl}) = _OrdersRemoteSource;

  @POST('/api/v1/orders')
  Future<CreateOrderResponse> createOrder(@Body() CreateOrderRequest request);

  @POST('/api/v1/order/photo/upload')
  @MultiPart()
  Future<FileUploadResponse> uploadOrderPhoto(@Part() MultipartFile file);
}
