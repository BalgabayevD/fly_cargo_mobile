import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/features/tariffs/domain/usecases/get_tariff_categories_usecase.dart';
import 'package:injectable/injectable.dart';
abstract class TariffSelectionEvent {}
class LoadTariffCategoriesEvent extends TariffSelectionEvent {}
class SelectTariffCategoryEvent extends TariffSelectionEvent {
  final int categoryId;
  SelectTariffCategoryEvent(this.categoryId);
}
class SelectTariffEvent extends TariffSelectionEvent {
  final int tariffId;
  SelectTariffEvent(this.tariffId);
}
class ClearSelectionEvent extends TariffSelectionEvent {}
abstract class TariffSelectionState {}
class TariffSelectionInitial extends TariffSelectionState {}
class TariffSelectionLoading extends TariffSelectionState {}
class TariffSelectionLoaded extends TariffSelectionState {
  final List<TariffCategoryModel> categories;
  final int? selectedCategoryId;
  final int? selectedTariffId;
  TariffSelectionLoaded({
    required this.categories,
    this.selectedCategoryId,
    this.selectedTariffId,
  });
  TariffSelectionLoaded copyWith({
    List<TariffCategoryModel>? categories,
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
  TariffSelectionError(this.message);
}
@injectable
class TariffSelectionBloc
    extends Bloc<TariffSelectionEvent, TariffSelectionState> {
  final GetTariffCategoriesUseCase _getTariffCategoriesUseCase;
  
  TariffSelectionBloc({
    required GetTariffCategoriesUseCase getTariffCategoriesUseCase,
  })  : _getTariffCategoriesUseCase = getTariffCategoriesUseCase,
        super(TariffSelectionInitial()) {
    on<LoadTariffCategoriesEvent>(_onLoadTariffCategories);
    on<SelectTariffCategoryEvent>(_onSelectTariffCategory);
    on<SelectTariffEvent>(_onSelectTariff);
    on<ClearSelectionEvent>(_onClearSelection);
  }
  Future<void> _onLoadTariffCategories(
    LoadTariffCategoriesEvent event,
    Emitter<TariffSelectionState> emit,
  ) async {
    emit(TariffSelectionLoading());
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
