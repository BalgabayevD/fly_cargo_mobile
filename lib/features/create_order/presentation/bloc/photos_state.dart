part of 'photos_bloc.dart';

sealed class PhotosState {
  const PhotosState();
}

class PhotosPickerState extends PhotosState with EquatableMixin {
  final List<OrderPhotoEntity> photos;

  const PhotosPickerState(this.photos);

  const PhotosPickerState.empty() : photos = const [];

  PhotosPickerState withItem(OrderPhotoEntity photo) {
    return PhotosPickerState([photo, ...photos]);
  }

  PhotosPickerState withReplace(OrderPhotoEntity photo) {
    final list = photos.map((element) {
      return element.key == photo.key ? photo : element;
    }).toList();
    return PhotosPickerState(list);
  }

  PhotosPickerState omit(OrderPhotoEntity photo) {
    final list = photos.where((element) {
      return element.key != photo.key;
    }).toList();
    return PhotosPickerState(list);
  }

  @override
  List<Object?> get props => [photos];

  int get itemsCount => min(photos.length + 1, 5);

  bool get isFulfilled => photos.every((e) => e.fingerprint != null);
}
