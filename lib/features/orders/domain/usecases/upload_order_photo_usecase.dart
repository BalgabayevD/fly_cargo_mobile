import 'dart:io';
import 'package:fly_cargo/features/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class UploadOrderPhotoUseCase {
  final OrdersRepository _ordersRepository;
  UploadOrderPhotoUseCase(this._ordersRepository);
  Future<String> call(File photoFile) async {
    return await _ordersRepository.uploadOrderPhoto(photoFile);
  }
}
