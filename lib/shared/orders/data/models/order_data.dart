import 'create_order_request.dart';

class OrderData {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final List<String> contentPhotos;
  final String description;
  final String fromAddress;
  final String fromApartment;
  final int fromCityId;
  final String fromEntrance;
  final String fromFloor;
  final double fromLatitude;
  final double fromLongitude;
  final double height;
  final double length;
  final List<String> photos;
  final int tariffId;
  final String toAddress;
  final String toApartment;
  final int toCityId;
  final String toEntrance;
  final String toFloor;
  final double toLatitude;
  final double toLongitude;
  final String toName;
  final String toPhone;
  final double volumetricWeight;
  final double weight;
  final double width;

  const OrderData({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.contentPhotos,
    required this.description,
    required this.fromAddress,
    required this.fromApartment,
    required this.fromCityId,
    required this.fromEntrance,
    required this.fromFloor,
    required this.fromLatitude,
    required this.fromLongitude,
    required this.height,
    required this.length,
    required this.photos,
    required this.tariffId,
    required this.toAddress,
    required this.toApartment,
    required this.toCityId,
    required this.toEntrance,
    required this.toFloor,
    required this.toLatitude,
    required this.toLongitude,
    required this.toName,
    required this.toPhone,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
  });

  CreateOrderRequest toCreateOrderRequest() {
    return CreateOrderRequest(
      isDefect: isDefect,
      isFragile: isFragile,
      category: category,
      comment: comment,
      contentPhotos: contentPhotos,
      description: description,
      fromAddress: fromAddress,
      fromApartment: fromApartment,
      fromCityId: fromCityId,
      fromEntrance: fromEntrance,
      fromFloor: fromFloor,
      fromLatitude: fromLatitude,
      fromLongitude: fromLongitude,
      height: height,
      length: length,
      photos: photos,
      tariffId: tariffId,
      toAddress: toAddress,
      toApartment: toApartment,
      toCityId: toCityId,
      toEntrance: toEntrance,
      toFloor: toFloor,
      toLatitude: toLatitude,
      toLongitude: toLongitude,
      toName: toName,
      toPhone: toPhone,
      volumetricWeight: volumetricWeight,
      weight: weight,
      width: width,
    );
  }
}

