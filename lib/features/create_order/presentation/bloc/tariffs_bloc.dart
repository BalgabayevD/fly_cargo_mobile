import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/tariffs_entity.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/tariffs_usecase.dart';
import 'package:injectable/injectable.dart';

part 'tariffs_event.dart';
part 'tariffs_state.dart';

@injectable
class TariffsBloc extends Bloc<TariffsEvent, TariffsState> {
  final TariffsUseCase tariffs;

  TariffsBloc(this.tariffs) : super(TariffsInitialState()) {
    on<TariffsLoadEvent>(_loadTariffs);
  }

  Future<void> _loadTariffs(
    TariffsLoadEvent event,
    Emitter<TariffsState> emit,
  ) async {
    try {
      final persistResult = await tariffs.getTariffsPersist();

      TariffsEntity tariff = TariffsEntity.empty();

      if (persistResult.isNotEmpty) {
        tariff = tariff.copyWith(
          tariffs: persistResult,
          selectedTariffId: persistResult.first.id,
        );
      }

      emit(TariffsLoadedState(tariff));

      final restResult = await tariffs.getTariffsRest();

      if (restResult.isNotEmpty) {
        tariff = tariff.copyWith(
          tariffs: restResult,
          selectedTariffId: restResult.first.id,
        );
      }

      emit(TariffsLoadedState(tariff));
    } catch (e) {
      print("_loadTariffs");
      print(e);
    }
  }
}
