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

  const CreateOrdersState({
    required this.data,
    this.photosValidationStatus = .idle,
    this.price = 0,
    this.photosValidationAttempt = 0,
    this.errors = const <String, String>{},
  });

  const CreateOrdersState.initial({
    this.data = const CreateOrderEntity(),
    this.photosValidationStatus = .idle,
    this.price = 0,
    this.photosValidationAttempt = 0,
    this.errors = const <String, String>{},
  });

  CreateOrdersState copyWith({
    CreateOrderEntity? data,
    PhotosValidationStatus? photosValidationStatus,
    Map<String, String>? errors,
    double? price,
  }) {
    return CreateOrdersState(
      data: data ?? this.data,
      photosValidationStatus:
          photosValidationStatus ?? this.photosValidationStatus,
      errors: errors ?? this.errors,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [data, photosValidationStatus, errors, price];
}
