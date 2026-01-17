import 'dart:io';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/order_photos_usecase.dart';
import 'package:injectable/injectable.dart';

part 'photos_event.dart';
part 'photos_state.dart';

@injectable
class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final OrderPhotosUseCase orderPhotos;

  PhotosBloc(this.orderPhotos) : super(PhotosPickerState.empty()) {
    on<PickPhotoEvent>(_pickPhoto);
    on<RemovePhotoEvent>(_deletePhoto);
  }

  Future<void> _pickPhoto(
    PickPhotoEvent event,
    Emitter<PhotosState> emit,
  ) async {
    if (state is PhotosPickerState) {
      final current = state as PhotosPickerState;

      final photo = OrderPhotoEntity(
        UniqueKey(),
        event.file,
        isUploading: true,
        fingerprint: null,
      );

      final stateWithPhoto = current.withItem(photo);

      emit(stateWithPhoto);

      final uploadedPhoto = await orderPhotos.uploadPhoto(photo);

      emit(stateWithPhoto.withReplace(uploadedPhoto));
    }
  }

  Future<void> _deletePhoto(
    RemovePhotoEvent event,
    Emitter<PhotosState> emit,
  ) async {
    if (state is PhotosPickerState) {
      final current = state as PhotosPickerState;

      emit(current.omit(event.photo));
    }
  }
}
