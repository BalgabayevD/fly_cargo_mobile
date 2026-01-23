part of 'create_orders_bloc.dart';

sealed class CreateOrdersEvent {
  const CreateOrdersEvent();
}

class AddPhotoOrdersCreateEvent extends CreateOrdersEvent {
  final List<OrderPhotoEntity> photos;

  const AddPhotoOrdersCreateEvent(this.photos);

  bool get isValid =>
      photos.every((e) => e.fingerprint != null) && photos.length == 5;

  List<String> get fingerprints =>
      photos.map((e) => e.fingerprint ?? '').toList();
}

class SubmitOrdersCreateEvent extends CreateOrdersEvent {
  const SubmitOrdersCreateEvent();
}

class ResetOrdersCreateEvent extends CreateOrdersEvent {
  const ResetOrdersCreateEvent();
}

class UpdateOrdersField {
  const UpdateOrdersField();
}

class UpdateOrdersLocationField extends UpdateOrdersField {
  final int fromCityId;
  final String fromAddress;
  final String fromFloor;
  final String fromEntrance;
  final String fromApartment;

  final double fromLatitude;
  final double fromLongitude;

  final int toCityId;
  final String toAddress;
  final String toFloor;
  final String toEntrance;
  final String toApartment;

  final double toLatitude;
  final double toLongitude;

  const UpdateOrdersLocationField({
    required this.fromCityId,
    required this.fromAddress,
    required this.fromFloor,
    required this.fromEntrance,
    required this.fromApartment,
    required this.fromLatitude,
    required this.fromLongitude,

    required this.toCityId,
    required this.toAddress,
    required this.toFloor,
    required this.toEntrance,
    required this.toApartment,
    required this.toLatitude,
    required this.toLongitude,
  });
}

class UpdateOrdersRecipientField extends UpdateOrdersField {
  final String toName;
  final String toPhone;

  const UpdateOrdersRecipientField(this.toName, this.toPhone);
}

class UpdateOrdersTariffField extends UpdateOrdersField {
  final int tariffId;

  const UpdateOrdersTariffField(this.tariffId);
}

class UpdateOrdersWeightField extends UpdateOrdersField {
  final double weight;

  const UpdateOrdersWeightField(this.weight);
}

class UpdateOrdersDescriptionField extends UpdateOrdersField {
  final String description;

  const UpdateOrdersDescriptionField(this.description);
}

class UpdateOrdersCreateEvent extends CreateOrdersEvent {
  final UpdateOrdersField field;

  const UpdateOrdersCreateEvent(this.field);
}
