part of 'create_orders_bloc.dart';

sealed class CreateOrdersState {
  const CreateOrdersState();
}

enum PhotosValidationStatus {
  idle,
  pending,
  moreInside,
  moreOutside,
  fulfilled,
}

class CreateOrdersCreateState extends CreateOrdersState with EquatableMixin {
  final CreateOrderEntity data;
  final PhotosValidationStatus photosValidationStatus;

  const CreateOrdersCreateState({
    required this.data,
    this.photosValidationStatus = .idle,
  });

  const CreateOrdersCreateState.initial({
    this.data = const CreateOrderEntity(),
    this.photosValidationStatus = .idle,
  });

  CreateOrdersCreateState copyWith({
    CreateOrderEntity? data,
    PhotosValidationStatus? photosValidationStatus,
  }) {
    return CreateOrdersCreateState(
      data: data ?? this.data,
      photosValidationStatus:
          photosValidationStatus ?? this.photosValidationStatus,
    );
  }

  @override
  List<Object?> get props => [data, photosValidationStatus];
}
