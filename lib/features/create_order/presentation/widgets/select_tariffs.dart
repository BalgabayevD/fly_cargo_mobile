import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_tariffs_dialogs.dart';
import 'package:fly_cargo/features/destination/domain/entities/tariffs_entity.dart';

class SelectTariffs extends StatelessWidget {
  final SelectTariffsDialogs dialogs;
  const SelectTariffs({
    super.key,
  }) : dialogs = const SelectTariffsDialogs();

  @override
  Widget build(BuildContext context) {
    return FieldListTile(
      label: 'Тариф',
      value: '22',
      onTap: () async {
        final a = await dialogs.toSelectTariffs(
          context,
          context.l10n.recipient,
          TariffsEntity(tariffs: []),
        );
        print(a);
      },
    );
  }
}
