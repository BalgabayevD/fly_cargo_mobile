import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/core/network/pre_order_dio_client.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/data/orders_remote_source.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteSource _remoteSource;
  final PreOrderDioClient _preOrderClient;

  OrdersRepositoryImpl(this._remoteSource, this._preOrderClient);
  @override
  Future<OrderResult> createOrder(OrderData orderData) async {
    try {
      final request = orderData.toCreateOrderRequest();
      final response = await _remoteSource.createOrder(request);
      return OrderResult.fromOrderModel(response.data);
    } catch (e) {
      throw OrdersException('Ошибка при создании заказа: $e');
    }
  }

  @override
  Future<PreCreateOrderResult> preCreateOrder(List<File> images) async {
    try {
      final responseData = await _preOrderClient.postPreOrder(images);

      final preCreateResponse = PreCreateOrderResponse.fromJson(responseData);

      if (preCreateResponse.data == null) {
        throw OrdersException('Сервер вернул пустые данные');
      }

      return preCreateResponse.data!;
    } catch (e, stackTrace) {
      throw OrdersException('Ошибка при анализе изображений: $e');
    }
  }

  @override
  Future<PriceCalculationModel> calculateOrderPrice({
    required int tariffId,
    required int fromCityId,
    required int toCityId,
    required String toPhone,
  }) async {
    try {
      final body = {
        'tariffId': tariffId,
        'fromCityId': fromCityId,
        'toCityId': toCityId,
        'toPhone': toPhone,
      };
      final response = await _remoteSource.calculateOrderPrice(body);
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при расчете стоимости заказа: $e');
    }
  }

  @override
  Future<String> uploadOrderPhoto(File photoFile) async {
    try {
      final fileName = photoFile.uri.pathSegments.last;
      final multipartFile = await MultipartFile.fromFile(
        photoFile.path,
        filename: fileName,
      );
      final response = await _remoteSource.uploadOrderPhoto(multipartFile);
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при загрузке фотографии: $e');
    }
  }

  @override
  Future<List<OrderModel>> getClientOrders() async {
    try {
      final response = await _remoteSource.getClientOrders();
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при загрузке заказов: $e');
    }
  }

  @override
  Future<List<OrderModel>> getCourierOrders() async {
    try {
      final response = await _remoteSource.getCourierOrders();
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при загрузке заказов: $e');
    }
  }

  @override
  Future<List<OrderModel>> getCreatedOrders() async {
    try {
      final response = await _remoteSource.getCreatedOrders();
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при загрузке заказов: $e');
    }
  }

  @override
  Future<OrderModel> getOrderById(String orderId) async {
    try {
      final response = await _remoteSource.getOrderById(orderId);
      return response.data;
    } catch (e) {
      throw OrdersException('Ошибка при загрузке заказа: $e');
    }
  }
}

class OrdersException implements Exception {
  final String message;
  const OrdersException(this.message);
  @override
  String toString() => 'OrdersException: $message';
}
