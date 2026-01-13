import 'dart:io';

import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class UploadOrderPhotoUseCase {
  final OrdersRepository _ordersRepository;
  UploadOrderPhotoUseCase(this._ordersRepository);
  Future<String> call(File photoFile) async {
    return await _ordersRepository.uploadOrderPhoto(photoFile);
  }
}
