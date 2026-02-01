part of 'courier_identify_order_bloc.dart';

sealed class CourierIdentifyOrderState {
  const CourierIdentifyOrderState();
}

class CourierIdentifyOrderInitialState extends CourierIdentifyOrderState {
  const CourierIdentifyOrderInitialState();
}

class CourierIdentifyOrderLoadingState extends CourierIdentifyOrderState {
  final String identification;

  const CourierIdentifyOrderLoadingState(this.identification);
}

class CourierIdentifyOrderSuccessState extends CourierIdentifyOrderState {
  final String identification;

  const CourierIdentifyOrderSuccessState(this.identification);
}

class CourierIdentifyOrderFailureState extends CourierIdentifyOrderState {
  final String identification;

  const CourierIdentifyOrderFailureState(this.identification);
}
