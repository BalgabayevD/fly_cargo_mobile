import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/order_photo_entity.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/create_orders_usecase.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_validators_impl.dart';
import 'package:fly_cargo/features/destination/domain/usecases/cities_use_case.dart';
import 'package:injectable/injectable.dart';

part 'create_orders_event.dart';
part 'create_orders_state.dart';

@injectable
class CreateOrdersBloc extends Bloc<CreateOrdersEvent, CreateOrdersState> {
  final CreateOrderValidator _validator = CreateOrderValidator.standard();

  final CreateOrdersUseCase createOrders;
  final CitiesUseCase cities;

  CreateOrdersBloc(this.createOrders, this.cities)
    : super(_getInitialState(cities)) {
    on<AddPhotoOrdersCreateEvent>(_onAddPhotoOrdersCreate);
    on<UpdateOrdersCreateEvent>(_updateFieldValue);
    on<SubmitOrdersCreateEvent>(_submit);
    on<ResetOrdersCreateEvent>(_reset);
  }

  static CreateOrdersState _getInitialState(CitiesUseCase cities) {
    final (fromCity, toCity) = cities.getInitialCities();

    return CreateOrdersState(
      data: const CreateOrderEntity().copyWith(
        fromCityId: fromCity.selectedCityId ?? 0,
        toCityId: toCity.selectedCityId ?? 0,
      ),
      photosValidationStatus: .idle,
      price: 0,
      photosValidationAttempt: 0,
      errors: const <String, String>{},
    );
  }

  Future<void> _onAddPhotoOrdersCreate(
    AddPhotoOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    if (!event.isValid) {
      Map<String, String> errors = {...state.errors};
      errors.remove('photos');

      emit(
        state.copyWith(
          data: state.data.copyWith(
            photos: event.fingerprints,
          ),
          photosValidationStatus: .idle,
          errors: errors,
        ),
      );
      return;
    }

    emit(state.copyWith(photosValidationStatus: .pending));

    final status = await createOrders.checkOrderByPhotos(
      event.fingerprints,
    );

    CreateOrderEntity data = state.data;
    PhotosValidationStatus photosValidationStatus =
        state.photosValidationStatus;

    int photosValidationAttempt = state.photosValidationAttempt;

    if (status == null) {
      photosValidationStatus = .idle;
    } else {
      if (status.status == AnalysisStatus.morePhotoInside) {
        photosValidationStatus = .moreInside;
        photosValidationAttempt = photosValidationAttempt + 1;
      }
      if (status.status == AnalysisStatus.morePhotoOutside) {
        photosValidationStatus = .moreOutside;
        photosValidationAttempt = photosValidationAttempt + 1;
      }
      if (status.status == AnalysisStatus.none) {
        photosValidationStatus = .fulfilled;

        data = data.copyWith(
          photos: event.fingerprints,
          tariffId: status.result.tariffId,
          length: status.result.length,
          width: status.result.width,
          height: status.result.height,
        );

        if (data.description.isEmpty) {
          data = data.copyWith(
            description: status.result.description,
          );
        }
        if (data.weight == 0) {
          data = data.copyWith(
            weight: status.result.weight,
          );
        }
      }
    }
    emit(
      state.copyWith(
        data: data,
        photosValidationStatus: photosValidationStatus,
      ),
    );
  }

  Future<void> _updateFieldValue(
    UpdateOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    if (event.field is UpdateOrdersRecipientField) {
      Map<String, String> errors = {...state.errors};
      errors.remove('toName');
      errors.remove('toPhone');
      final field = event.field as UpdateOrdersRecipientField;
      final data = state.data.copyWith(
        toName: field.toName,
        toPhone: field.toPhone,
      );
      emit(state.copyWith(data: data, errors: errors));
    }

    if (event.field is UpdateOrdersTariffField) {
      Map<String, String> errors = {...state.errors};
      errors.remove('tariffId');
      final data = state.data.copyWith(
        tariffId: (event.field as UpdateOrdersTariffField).tariffId,
      );
      emit(state.copyWith(data: data, errors: errors));
    }

    if (event.field is UpdateOrdersWeightField) {
      Map<String, String> errors = {...state.errors};
      errors.remove('weight');
      final data = state.data.copyWith(
        weight: (event.field as UpdateOrdersWeightField).weight,
      );
      emit(state.copyWith(data: data, errors: errors));
    }

    if (event.field is UpdateOrdersDescriptionField) {
      Map<String, String> errors = {...state.errors};
      errors.remove('description');
      final field = event.field as UpdateOrdersDescriptionField;

      final data = state.data.copyWith(
        description: field.description,
      );

      emit(state.copyWith(data: data, errors: errors));
    }

    if (event.field is UpdateOrdersLocationField) {
      Map<String, String> errors = {...state.errors};
      errors.remove('fromCityId');
      errors.remove('fromAddress');
      errors.remove('fromFloor');
      errors.remove('fromEntrance');
      errors.remove('fromApartment');
      errors.remove('fromLatitude');
      errors.remove('fromLongitude');

      errors.remove('toCityId');
      errors.remove('toAddress');
      errors.remove('toFloor');
      errors.remove('toEntrance');
      errors.remove('toApartment');
      errors.remove('toLatitude');
      errors.remove('toLongitude');

      final field = event.field as UpdateOrdersLocationField;

      final data = state.data.copyWith(
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
      emit(state.copyWith(data: data, errors: errors));
    }

    if (state.data.isCheckPrice) {
      final price = await createOrders.getPrice(state.data);

      emit(state.copyWith(price: price));
    }
  }

  Future<void> _submit(
    SubmitOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    final errors = _validator.validate(state.data);

    if (errors.isNotEmpty) {
      emit(state.copyWith(errors: errors));
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    final createdOrder = await createOrders.createOrder(state.data);
    emit(state.copyWith(isSubmitting: false, createdOrderId: createdOrder?.id));
  }

  Future<void> _reset(
    ResetOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    emit(_getInitialState(cities));
  }
}
