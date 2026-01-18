import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/data/models/order_data.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/pre_create_order_usecase.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_event.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final PreCreateOrderUseCase _preCreateOrderUseCase;

  CreateOrderBloc(
    this._preCreateOrderUseCase,
  ) : super(const CreateOrderInitial()) {
    on<CreateOrderSubmitEvent>(_onCreateOrder);
    on<SubmitOrderFormEvent>(_onSubmitOrderForm);
    on<PreCreateOrderEvent>(_onPreCreateOrder);
    on<ResetCreateOrderEvent>(_onResetOrder);
  }

  Future<void> _onCreateOrder(
    CreateOrderSubmitEvent event,
    Emitter<CreateOrderState> emit,
  ) async {
    emit(const CreateOrderLoading());
    try {} catch (e) {
      if (_isUnauthorized(e)) {
        emit(const CreateOrderUnauthorized());
      } else {
        emit(CreateOrderError(message: e.toString()));
      }
    }
  }

  Future<void> _onSubmitOrderForm(
    SubmitOrderFormEvent event,
    Emitter<CreateOrderState> emit,
  ) async {
    // Валидация данных
    if (event.fromAddress == null || event.toAddress == null) {
      emit(
        const OrderValidationError(
          message: 'Укажите адреса отправки и доставки',
        ),
      );
      return;
    }

    if (event.recipientName == null || event.recipientPhone == null) {
      emit(
        const OrderValidationError(
          message: 'Укажите данные получателя',
        ),
      );
      return;
    }

    if (event.selectedTariffId == null || event.selectedTariff == null) {
      emit(
        const OrderValidationError(
          message: 'Выберите тариф',
        ),
      );
      return;
    }

    if (event.description == null || event.description!.isEmpty) {
      emit(
        const OrderValidationError(
          message: 'Укажите описание посылки',
        ),
      );
      return;
    }

    // Подготовка данных для заказа
    final length = event.customLength ?? event.selectedTariff!.length;
    final width = event.customWidth ?? event.selectedTariff!.width;

    final photoIds = event.photos
        .map((photo) => event.photoIds[photo] ?? '')
        .where((id) => id.isNotEmpty)
        .toList();

    final orderData = OrderData(
      isDefect: false,
      isFragile: event.isFragile,
      comment: '',
      contentPhotos: [],
      description: event.description!,
      fromAddress: event.fromAddress!.fullAddress ?? event.fromAddress!.address,
      fromApartment: event.fromAddress!.apartment ?? '',
      fromCityId: int.tryParse(event.fromAddress!.cityId) ?? 0,
      fromEntrance: event.fromAddress!.entrance ?? '',
      fromFloor: event.fromAddress!.floor?.isNotEmpty == true
          ? event.fromAddress!.floor
          : null,
      height: event.customHeight ?? event.selectedTariff!.height ?? 0.0,
      length: length ?? 0.0,
      photos: photoIds,
      tariffId: event.selectedTariffId!,
      toAddress: event.toAddress!.fullAddress ?? event.toAddress!.address,
      toApartment: event.toAddress!.apartment ?? '',
      toCityId: int.tryParse(event.toAddress!.cityId) ?? 0,
      toEntrance: event.toAddress!.entrance ?? '',
      toFloor: event.toAddress!.floor?.isNotEmpty == true
          ? event.toAddress!.floor
          : null,
      toName: event.recipientName!,
      toPhone: event.recipientPhone!,
      volumetricWeight: event.selectedTariff!.volumetricWeight,
      weight: event.selectedTariff!.weight ?? 0.0,
      width: width ?? 0.0,
    );

    // Создание заказа
    emit(const CreateOrderLoading());
    try {} catch (e) {
      if (_isUnauthorized(e)) {
        emit(const CreateOrderUnauthorized());
      } else {
        emit(CreateOrderError(message: e.toString()));
      }
    }
  }

  Future<void> _onPreCreateOrder(
    PreCreateOrderEvent event,
    Emitter<CreateOrderState> emit,
  ) async {
    emit(const CreateOrderLoading());
    try {
      final result = await _preCreateOrderUseCase.call(event.images);
      emit(
        PreOrderAnalyzed(
          preOrderData: result.result,
          analysisStatus: result.status,
        ),
      );
    } catch (e) {
      if (_isUnauthorized(e)) {
        emit(const CreateOrderUnauthorized());
      } else {
        emit(CreateOrderError(message: e.toString()));
      }
    }
  }

  void _onResetOrder(
    ResetCreateOrderEvent event,
    Emitter<CreateOrderState> emit,
  ) {
    emit(const CreateOrderInitial());
  }

  bool _isUnauthorized(Object e) {
    if (e is DioException) {
      return e.response?.statusCode == 401;
    }
    return e.toString().contains('401') ||
        e.toString().toLowerCase().contains('unauthorized');
  }
}
