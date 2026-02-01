part of 'courier_submit_order_bloc.dart';

sealed class CourierSubmitOrderEvent {
  const CourierSubmitOrderEvent();
}

class CourierSubmitOrderLoadEvent extends CourierSubmitOrderEvent {
  final int orderId;

  const CourierSubmitOrderLoadEvent(this.orderId);
}

class CourierSubmitOrderSubmitEvent extends CourierSubmitOrderEvent {
  const CourierSubmitOrderSubmitEvent();
}

class UpdateOrdersField {
  const UpdateOrdersField();
}

class UpdateOrdersTariffField extends UpdateOrdersField {
  final int tariffId;

  const UpdateOrdersTariffField(this.tariffId);
}

class UpdateOrdersWeightField extends UpdateOrdersField {
  final double weight;

  const UpdateOrdersWeightField(this.weight);
}

class UpdateOrdersDefectField extends UpdateOrdersField {
  final bool isDefect;

  const UpdateOrdersDefectField(this.isDefect);
}

class UpdateOrdersDefectPhotosField extends UpdateOrdersField {
  final List<OrderPhotoEntity> defectPhotos;

  const UpdateOrdersDefectPhotosField(this.defectPhotos);
}

class CourierSubmitOrderUpdateEvent extends CourierSubmitOrderEvent {
  final UpdateOrdersField field;

  const CourierSubmitOrderUpdateEvent(this.field);
}
