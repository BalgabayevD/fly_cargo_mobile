import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';

class TariffsEntity extends Equatable {
  final List<TariffEntity> tariffs;
  final int? selectedTariffId;

  const TariffsEntity({
    required this.tariffs,
    this.selectedTariffId,
  });

  const TariffsEntity.empty() : this(tariffs: const <TariffEntity>[]);

  @override
  List<Object?> get props => [
    tariffs,
    selectedTariffId,
  ];

  TariffsEntity copyWith({
    List<TariffEntity>? tariffs,
    int? selectedTariffId,
  }) {
    return TariffsEntity(
      tariffs: tariffs ?? this.tariffs,
      selectedTariffId: selectedTariffId ?? this.selectedTariffId,
    );
  }

  TariffEntity? get tariff {
    if (selectedTariffId == null) return null;

    final isAny = tariffs.any((tariff) => tariff.id == selectedTariffId);

    if (!isAny) return null;

    return tariffs.firstWhere((c) => c.id == selectedTariffId);
  }

  String get listTileLabel {
    if (tariff != null) {
      return tariff!.name;
    }

    return '';
  }
}
