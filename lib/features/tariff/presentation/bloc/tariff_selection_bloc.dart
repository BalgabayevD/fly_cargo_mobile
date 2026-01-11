import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';
import 'package:fly_cargo/features/tariffs/domain/usecases/get_tariff_categories_usecase.dart';
import 'package:injectable/injectable.dart';

abstract class TariffSelectionEvent extends Equatable {
  const TariffSelectionEvent();

  @override
  List<Object?> get props => [];
}

class LoadTariffCategoriesEvent extends TariffSelectionEvent {
  const LoadTariffCategoriesEvent();
}

class SelectTariffCategoryEvent extends TariffSelectionEvent {
  final int categoryId;

  const SelectTariffCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class SelectTariffEvent extends TariffSelectionEvent {
  final int tariffId;

  const SelectTariffEvent(this.tariffId);

  @override
  List<Object?> get props => [tariffId];
}

class ClearSelectionEvent extends TariffSelectionEvent {
  const ClearSelectionEvent();
}

abstract class TariffSelectionState extends Equatable {
  const TariffSelectionState();

  @override
  List<Object?> get props => [];
}

class TariffSelectionInitial extends TariffSelectionState {
  const TariffSelectionInitial();
}

class TariffSelectionLoading extends TariffSelectionState {
  const TariffSelectionLoading();
}

class TariffSelectionLoaded extends TariffSelectionState {
  final List<TariffCategoryEntity> categories;
  final int? selectedCategoryId;
  final int? selectedTariffId;

  const TariffSelectionLoaded({
    required this.categories,
    this.selectedCategoryId,
    this.selectedTariffId,
  });

  @override
  List<Object?> get props => [categories, selectedCategoryId, selectedTariffId];

  TariffSelectionLoaded copyWith({
    List<TariffCategoryEntity>? categories,
    int? selectedCategoryId,
    int? selectedTariffId,
  }) {
    return TariffSelectionLoaded(
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedTariffId: selectedTariffId ?? this.selectedTariffId,
    );
  }
}

class TariffSelectionError extends TariffSelectionState {
  final String message;

  const TariffSelectionError(this.message);

  @override
  List<Object?> get props => [message];
}

@injectable
class TariffSelectionBloc
    extends Bloc<TariffSelectionEvent, TariffSelectionState> {
  final GetTariffCategoriesUseCase _getTariffCategoriesUseCase;

  TariffSelectionBloc({
    required GetTariffCategoriesUseCase getTariffCategoriesUseCase,
  })  : _getTariffCategoriesUseCase = getTariffCategoriesUseCase,
        super(const TariffSelectionInitial()) {
    on<LoadTariffCategoriesEvent>(_onLoadTariffCategories);
    on<SelectTariffCategoryEvent>(_onSelectTariffCategory);
    on<SelectTariffEvent>(_onSelectTariff);
    on<ClearSelectionEvent>(_onClearSelection);
  }

  Future<void> _onLoadTariffCategories(
    LoadTariffCategoriesEvent event,
    Emitter<TariffSelectionState> emit,
  ) async {
    emit(const TariffSelectionLoading());
    try {
      final categories = await _getTariffCategoriesUseCase();
      final categoriesWithTariffs = categories
          .where(
            (category) =>
                category.tariffs != null && category.tariffs!.isNotEmpty,
          )
          .toList();
      final firstCategoryId = categoriesWithTariffs.isNotEmpty
          ? categoriesWithTariffs.first.id
          : null;
      emit(
        TariffSelectionLoaded(
          categories: categories,
          selectedCategoryId: firstCategoryId,
        ),
      );
    } catch (e) {
      emit(
        TariffSelectionError(
          'Ошибка загрузки категорий тарифов: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onSelectTariffCategory(
    SelectTariffCategoryEvent event,
    Emitter<TariffSelectionState> emit,
  ) async {
    if (state is TariffSelectionLoaded) {
      final currentState = state as TariffSelectionLoaded;
      emit(
        currentState.copyWith(
          selectedCategoryId: event.categoryId,
          selectedTariffId: null,
        ),
      );
    }
  }

  Future<void> _onSelectTariff(
    SelectTariffEvent event,
    Emitter<TariffSelectionState> emit,
  ) async {
    if (state is TariffSelectionLoaded) {
      final currentState = state as TariffSelectionLoaded;
      emit(currentState.copyWith(selectedTariffId: event.tariffId));
    }
  }

  Future<void> _onClearSelection(
    ClearSelectionEvent event,
    Emitter<TariffSelectionState> emit,
  ) async {
    if (state is TariffSelectionLoaded) {
      final currentState = state as TariffSelectionLoaded;
      emit(
        currentState.copyWith(selectedCategoryId: null, selectedTariffId: null),
      );
    }
  }
}
