import 'package:fly_cargo/core/entities/box_entity.dart';
class PackageEntity {
  final String id;
  final BoxEntity box;
  final String? recipientName;
  final String? recipientPhone;
  final String? cargoDescription;
  final List<String> packagingPhotos;
  final List<String> contentPhotos;
  final bool isInsured;
  final double? insuranceValue;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const PackageEntity({
    required this.id,
    required this.box,
    required this.createdAt, this.recipientName,
    this.recipientPhone,
    this.cargoDescription,
    this.packagingPhotos = const [],
    this.contentPhotos = const [],
    this.isInsured = false,
    this.insuranceValue,
    this.updatedAt,
  });
  PackageEntity copyWith({
    String? id,
    BoxEntity? box,
    String? recipientName,
    String? recipientPhone,
    String? cargoDescription,
    List<String>? packagingPhotos,
    List<String>? contentPhotos,
    bool? isInsured,
    double? insuranceValue,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PackageEntity(
      id: id ?? this.id,
      box: box ?? this.box,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      cargoDescription: cargoDescription ?? this.cargoDescription,
      packagingPhotos: packagingPhotos ?? this.packagingPhotos,
      contentPhotos: contentPhotos ?? this.contentPhotos,
      isInsured: isInsured ?? this.isInsured,
      insuranceValue: insuranceValue ?? this.insuranceValue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PackageEntity &&
        other.id == id &&
        other.box == box &&
        other.recipientName == recipientName &&
        other.recipientPhone == recipientPhone &&
        other.cargoDescription == cargoDescription &&
        other.packagingPhotos == packagingPhotos &&
        other.contentPhotos == contentPhotos &&
        other.isInsured == isInsured &&
        other.insuranceValue == insuranceValue &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }
  @override
  int get hashCode {
    return id.hashCode ^
        box.hashCode ^
        recipientName.hashCode ^
        recipientPhone.hashCode ^
        cargoDescription.hashCode ^
        packagingPhotos.hashCode ^
        contentPhotos.hashCode ^
        isInsured.hashCode ^
        insuranceValue.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
  @override
  String toString() {
    return 'PackageEntity(id: $id, box: $box, recipientName: $recipientName, isInsured: $isInsured)';
  }
}
