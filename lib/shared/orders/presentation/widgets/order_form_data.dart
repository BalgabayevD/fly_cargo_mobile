import 'dart:io';

class OrderFormData {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final String description;
  final String fromApartment;
  final String fromEntrance;
  final String fromFloor;
  final String toApartment;
  final String toEntrance;
  final String toFloor;
  final List<File> contentPhotos;
  final List<String> contentPhotoIds;

  const OrderFormData({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.description,
    required this.fromApartment,
    required this.fromEntrance,
    required this.fromFloor,
    required this.toApartment,
    required this.toEntrance,
    required this.toFloor,
    this.contentPhotos = const [],
    this.contentPhotoIds = const [],
  });

  OrderFormData copyWith({
    bool? isDefect,
    bool? isFragile,
    String? category,
    String? comment,
    String? description,
    String? fromApartment,
    String? fromEntrance,
    String? fromFloor,
    String? toApartment,
    String? toEntrance,
    String? toFloor,
    List<File>? contentPhotos,
    List<String>? contentPhotoIds,
  }) {
    return OrderFormData(
      isDefect: isDefect ?? this.isDefect,
      isFragile: isFragile ?? this.isFragile,
      category: category ?? this.category,
      comment: comment ?? this.comment,
      description: description ?? this.description,
      fromApartment: fromApartment ?? this.fromApartment,
      fromEntrance: fromEntrance ?? this.fromEntrance,
      fromFloor: fromFloor ?? this.fromFloor,
      toApartment: toApartment ?? this.toApartment,
      toEntrance: toEntrance ?? this.toEntrance,
      toFloor: toFloor ?? this.toFloor,
      contentPhotos: contentPhotos ?? this.contentPhotos,
      contentPhotoIds: contentPhotoIds ?? this.contentPhotoIds,
    );
  }
}
