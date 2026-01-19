import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/create_orders_usecase.dart';
import 'package:injectable/injectable.dart';

part 'create_orders_event.dart';
part 'create_orders_state.dart';

@injectable
class CreateOrdersBloc extends Bloc<CreateOrdersEvent, CreateOrdersState> {
  final CreateOrdersUseCase createOrders;

  CreateOrdersBloc(this.createOrders)
    : super(const CreateOrdersCreateState.initial()) {
    on<AddPhotoOrdersCreateEvent>(_onAddPhotoOrdersCreate);
    on<UpdateOrdersCreateEvent>(_updateFieldValue);
  }

  Future<void> _onAddPhotoOrdersCreate(
    AddPhotoOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    if (state is CreateOrdersCreateState) {
      final currentState = state as CreateOrdersCreateState;

      if (!event.isValid) {
        emit(
          currentState.copyWith(
            data: currentState.data.copyWith(
              photos: event.fingerprints,
            ),
            photosValidationStatus: .idle,
          ),
        );
        return;
      }

      emit(currentState.copyWith(photosValidationStatus: .pending));

      final status = await createOrders.checkOrderByPhotos(
        event.fingerprints,
      );

      CreateOrderEntity data = currentState.data;
      PhotosValidationStatus photosValidationStatus =
          currentState.photosValidationStatus;

      if (status == null) {
        photosValidationStatus = .idle;
      } else {
        if (status.status == AnalysisStatus.morePhotoInside) {
          photosValidationStatus = .moreInside;
        }
        if (status.status == AnalysisStatus.morePhotoOutside) {
          photosValidationStatus = .moreOutside;
        }
        if (status.status == AnalysisStatus.none) {
          photosValidationStatus = .fulfilled;

          data = data.copyWith(
            photos: event.fingerprints,
            description: status.result.description,
            tariffId: status.result.tariffId,
            weight: status.result.weight,
            length: status.result.length,
            width: status.result.width,
            height: status.result.height,
          );
        }
      }
      emit(
        currentState.copyWith(
          data: data,
          photosValidationStatus: photosValidationStatus,
        ),
      );
    }
  }

  Future<void> _updateFieldValue(
    UpdateOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    if (state is CreateOrdersCreateState) {
      final current = state as CreateOrdersCreateState;
      if (event.field is UpdateOrdersRecipientField) {
        final field = event.field as UpdateOrdersRecipientField;
        final data = current.data.copyWith(
          toName: field.toName,
          toPhone: field.toPhone,
        );
        emit(current.copyWith(data: data));
      }

      if (event.field is UpdateOrdersTariffField) {
        final data = current.data.copyWith(
          tariffId: (event.field as UpdateOrdersTariffField).tariffId,
        );
        emit(current.copyWith(data: data));
      }

      if (event.field is UpdateOrdersWeightField) {
        final data = current.data.copyWith(
          weight: (event.field as UpdateOrdersWeightField).weight,
        );
        emit(current.copyWith(data: data));
      }

      if (event.field is UpdateOrdersDescriptionField) {
        final field = event.field as UpdateOrdersDescriptionField;

        final data = current.data.copyWith(
          description: field.description,
        );

        emit(current.copyWith(data: data));
      }

      if (event.field is UpdateOrdersLocationField) {
        final field = event.field as UpdateOrdersLocationField;

        final data = current.data.copyWith(
          fromCityId: field.fromCityId,
          fromAddress: field.fromAddress,
          fromFloor: field.fromFloor,
          fromEntrance: field.fromEntrance,
          fromApartment: field.fromApartment,
          fromLatitude: field.fromLatitude,
          fromLongitude: field.fromLongitude,

          toCityId: field.toCityId,
          toAddress: field.toAddress,
          toFloor: field.toFloor,
          toEntrance: field.toEntrance,
          toApartment: field.toApartment,
          toLatitude: field.toLatitude,
          toLongitude: field.toLongitude,
        );
        emit(current.copyWith(data: data));
      }
    }
  }
}
