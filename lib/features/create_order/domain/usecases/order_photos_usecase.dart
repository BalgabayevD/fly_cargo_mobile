import 'package:dio/dio.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/order_photos_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderPhotosUseCase {
  final OrderPhotosRepository orderPhotos;

  const OrderPhotosUseCase(this.orderPhotos);

  Future<OrderPhotoEntity> uploadPhoto(OrderPhotoEntity photo) async {
    final fileData = await MultipartFile.fromFile(
      photo.file.path,
      filename: photo.file.path.split('/').last,
    );

    final form = FormData.fromMap({
      'file': fileData,
    });

    final fingerprint = await orderPhotos.uploadPhoto(form);

    return photo.copyWith(fingerprint: fingerprint, isUploading: false);
  }
}
