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
  }

  Future<void> _onAddPhotoOrdersCreate(
    AddPhotoOrdersCreateEvent event,
    Emitter<CreateOrdersState> emit,
  ) async {
    print(state);
    if (state is CreateOrdersCreateState) {
      final currentState = state as CreateOrdersCreateState;

      emit(currentState.copyWith(photosValidationStatus: .pending));

      if (!event.isValid) return;

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
}
