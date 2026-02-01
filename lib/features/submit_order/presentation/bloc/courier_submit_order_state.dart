part of 'courier_submit_order_bloc.dart';

sealed class CourierSubmitOrderState {
  const CourierSubmitOrderState();
}

class CourierSubmitOrderInitialState extends CourierSubmitOrderState {}

class CourierSubmitOrderLoadingState extends CourierSubmitOrderState {
  final int orderId;

  const CourierSubmitOrderLoadingState(this.orderId);
}

class CourierSubmitOrderLoadedState extends CourierSubmitOrderState {
  final OrderEntity order;
  final int tariffId;
  final double weight;
  final bool isDefect;
  final List<OrderPhotoEntity> defectPhotos;
  final bool isLoading;
  final bool isSubmitted;

  const CourierSubmitOrderLoadedState({
    required this.tariffId,
    required this.weight,
    required this.isDefect,
    required this.defectPhotos,
    required this.order,
    required this.isLoading,
    required this.isSubmitted,
  });

  CourierSubmitOrderLoadedState copyWith({
    OrderEntity? order,
    int? tariffId,
    double? weight,
    bool? isDefect,
    List<OrderPhotoEntity>? defectPhotos,
    bool? isLoading,
    bool? isSubmitted,
  }) {
    return CourierSubmitOrderLoadedState(
      order: order ?? this.order,
      tariffId: tariffId ?? this.tariffId,
      weight: weight ?? this.weight,
      isDefect: isDefect ?? this.isDefect,
      defectPhotos: defectPhotos ?? this.defectPhotos,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  SubmitOrderEntity toEntity() {
    return SubmitOrderEntity(
      orderId: order.id,
      tariffId: tariffId,
      isDefect: isDefect,
      defectPhotos: defectPhotos
          .where((e) => e.fingerprint != null)
          .map((e) => e.fingerprint!)
          .toList(),
      weight: weight,
    );
  }
}
