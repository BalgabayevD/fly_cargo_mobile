part of 'create_orders_bloc.dart';

sealed class CreateOrdersEvent {
  const CreateOrdersEvent();
}

class AddPhotoOrdersCreateEvent extends CreateOrdersEvent {
  final List<OrderPhotoEntity> photos;

  const AddPhotoOrdersCreateEvent(this.photos);

  bool get isValid => photos.every((e) => e.fingerprint != null);

  List<String> get fingerprints =>
      photos.map((e) => e.fingerprint ?? '').toList();
}

class SubmitOrdersCreateEvent extends CreateOrdersEvent {
  const SubmitOrdersCreateEvent();
}
