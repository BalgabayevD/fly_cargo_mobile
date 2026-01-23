part of 'create_orders_bloc.dart';

enum PhotosValidationStatus {
  idle,
  pending,
  moreInside,
  moreOutside,
  fulfilled,
}

class CreateOrdersState with EquatableMixin {
  final CreateOrderEntity data;
  final PhotosValidationStatus photosValidationStatus;
  final int photosValidationAttempt;
  final double price;
  final Map<String, String> errors;
  final int? createdOrderId;
  final bool isSubmitting;

  const CreateOrdersState({
    required this.data,
    this.photosValidationStatus = .idle,
    this.price = 0,
    this.photosValidationAttempt = 0,
    this.errors = const <String, String>{},
    this.createdOrderId,
    this.isSubmitting = false,
  });

  CreateOrdersState copyWith({
    CreateOrderEntity? data,
    PhotosValidationStatus? photosValidationStatus,
    Map<String, String>? errors,
    double? price,
    int? createdOrderId,
    bool? isSubmitting,
  }) {
    return CreateOrdersState(
      data: data ?? this.data,
      photosValidationStatus:
          photosValidationStatus ?? this.photosValidationStatus,
      errors: errors ?? this.errors,
      price: price ?? this.price,
      createdOrderId: createdOrderId ?? this.createdOrderId,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [
    data,
    photosValidationStatus,
    errors,
    price,
    isSubmitting,
  ];
}
