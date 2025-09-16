import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/core/usecases/get_box_by_type_usecase.dart';
import 'package:fly_cargo/core/usecases/get_boxes_usecase.dart';

// Events
abstract class BoxSelectionEvent {}

class LoadBoxesEvent extends BoxSelectionEvent {}

class SelectBoxEvent extends BoxSelectionEvent {
  final String boxType;

  SelectBoxEvent(this.boxType);
}

class ClearSelectionEvent extends BoxSelectionEvent {}

// States
abstract class BoxSelectionState {}

class BoxSelectionInitial extends BoxSelectionState {}

class BoxSelectionLoading extends BoxSelectionState {}

class BoxSelectionLoaded extends BoxSelectionState {
  final List<BoxEntity> boxes;
  final String? selectedBoxType;

  BoxSelectionLoaded({required this.boxes, this.selectedBoxType});

  BoxSelectionLoaded copyWith({
    List<BoxEntity>? boxes,
    String? selectedBoxType,
  }) {
    return BoxSelectionLoaded(
      boxes: boxes ?? this.boxes,
      selectedBoxType: selectedBoxType ?? this.selectedBoxType,
    );
  }
}

class BoxSelectionError extends BoxSelectionState {
  final String message;

  BoxSelectionError(this.message);
}

// BLoC
class BoxSelectionBloc extends Bloc<BoxSelectionEvent, BoxSelectionState> {
  final GetBoxesUseCase _getBoxesUseCase;

  BoxSelectionBloc({
    required GetBoxesUseCase getBoxesUseCase,
    required GetBoxByTypeUseCase getBoxByTypeUseCase,
  }) : _getBoxesUseCase = getBoxesUseCase,
       super(BoxSelectionInitial()) {
    on<LoadBoxesEvent>(_onLoadBoxes);
    on<SelectBoxEvent>(_onSelectBox);
    on<ClearSelectionEvent>(_onClearSelection);
  }

  Future<void> _onLoadBoxes(
    LoadBoxesEvent event,
    Emitter<BoxSelectionState> emit,
  ) async {
    emit(BoxSelectionLoading());

    try {
      final boxes = await _getBoxesUseCase();
      emit(BoxSelectionLoaded(boxes: boxes));
    } catch (e) {
      emit(BoxSelectionError('Ошибка загрузки коробок: ${e.toString()}'));
    }
  }

  Future<void> _onSelectBox(
    SelectBoxEvent event,
    Emitter<BoxSelectionState> emit,
  ) async {
    if (state is BoxSelectionLoaded) {
      final currentState = state as BoxSelectionLoaded;
      emit(currentState.copyWith(selectedBoxType: event.boxType));
    }
  }

  Future<void> _onClearSelection(
    ClearSelectionEvent event,
    Emitter<BoxSelectionState> emit,
  ) async {
    if (state is BoxSelectionLoaded) {
      final currentState = state as BoxSelectionLoaded;
      emit(currentState.copyWith(selectedBoxType: null));
    }
  }
}
