import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/payments/domain/usecases/add_card_usecase.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_event.dart';
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  final AddCardUseCase _addCardUseCase;
  
  AddCardBloc(this._addCardUseCase) : super(const AddCardInitial()) {
    on<AddCardRequested>(_onAddCardRequested);
    on<AddCardCompleted>(_onAddCardCompleted);
    on<AddCardCancelled>(_onAddCardCancelled);
  }
  
  Future<void> _onAddCardRequested(
    AddCardRequested event,
    Emitter<AddCardState> emit,
  ) async {
    emit(const AddCardLoading());
    try {
      final formUrl = await _addCardUseCase();
      emit(AddCardFormReady(formUrl));
    } catch (e) {
      emit(AddCardError('Не удалось загрузить форму добавления карты: ${e.toString()}'));
    }
  }
  
  Future<void> _onAddCardCompleted(
    AddCardCompleted event,
    Emitter<AddCardState> emit,
  ) async {
    emit(const AddCardSuccess());
  }
  
  Future<void> _onAddCardCancelled(
    AddCardCancelled event,
    Emitter<AddCardState> emit,
  ) async {
    emit(const AddCardInitial());
  }
}

