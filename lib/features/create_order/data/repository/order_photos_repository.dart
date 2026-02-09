import 'package:dio/dio.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/order_photos_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderPhotosRepository)
class OrderPhotosRepositoryImpl implements OrderPhotosRepository {
  final Requestable requestable;
  final Configuration configuration;

  OrderPhotosRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<String> uploadPhoto(FormData form) async {
    try {
      final response = await requestable.dio.post(
        '$_/upload/photo',
        data: form,
        options: Options(
          headers: {
            'Content-Type': 'null',
          },
        ),
      );

      return response.data['data'] as String;
    } catch (e) {
      rethrow;
    }
  }
}
