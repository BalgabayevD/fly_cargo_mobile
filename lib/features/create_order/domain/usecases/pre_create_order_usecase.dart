import 'dart:io';

import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class PreCreateOrderUseCase {
  final OrdersRepository _repository;

  PreCreateOrderUseCase(this._repository);

  Future<PreCreateOrderResult> call(List<File> images) async {
    if (images.isEmpty) {
      throw Exception('Необходимо загрузить хотя бы одно изображение');
    }

    return await _repository.preCreateOrder(images);
  }
}

