import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';

class TariffsEntity extends Equatable {
  final List<TariffModel> tariffs;
  final int? selectedTariffId;

  const TariffsEntity({
    required this.tariffs,
    this.selectedTariffId,
  });

  const TariffsEntity.empty() : this(tariffs: const <TariffModel>[]);

  @override
  List<Object?> get props => [
    tariffs,
    selectedTariffId,
  ];

  TariffsEntity copyWith({
    List<TariffModel>? tariffs,
    int? selectedTariffId,
  }) {
    return TariffsEntity(
      tariffs: tariffs ?? this.tariffs,
      selectedTariffId: selectedTariffId ?? this.selectedTariffId,
    );
  }

  TariffModel? findById(int id) {
    final isAny = tariffs.any((tariff) => tariff.id == id);

    if (!isAny) return null;

    return tariffs.firstWhere((c) => c.id == id);
  }

  TariffModel? get tariff {
    if (selectedTariffId != null) {
      return findById(selectedTariffId!);
    }
    return null;
  }
}
