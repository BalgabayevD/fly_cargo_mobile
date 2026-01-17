part of 'photos_bloc.dart';

sealed class PhotosEvent {
  const PhotosEvent();
}

class PickPhotoEvent extends PhotosEvent {
  final File file;

  const PickPhotoEvent(this.file);
}

class RemovePhotoEvent extends PhotosEvent {
  final OrderPhotoEntity photo;

  const RemovePhotoEvent(this.photo);
}
