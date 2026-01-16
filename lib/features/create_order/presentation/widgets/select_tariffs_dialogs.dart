import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/features/create_order/presentation/notifier/tariffs_notifier.dart';
import 'package:fly_cargo/features/destination/domain/entities/tariffs_entity.dart';
import 'package:go_router/go_router.dart';

class SelectTariffsDialogs {
  const SelectTariffsDialogs();

  Future<TariffsEntity?> toSelectTariffs(
    BuildContext context,
    String text,
    TariffsEntity tariffs,
  ) {
    TariffsNotifier notifier = TariffsNotifier(tariffs: tariffs);

    return BeBottomDialog.showBottomDialog<TariffsEntity?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      text: text,
      builder: (BuildContext context, ScrollController controller) {
        return ListenableBuilder(
          listenable: notifier,
          builder: (BuildContext context, Widget? child) {
            return BeDialogBody(
              controller: controller,
              text: 'Тариф',
              action: BeButton(
                text: 'Сохранить',
                onPressed: () {
                  context.pop(notifier.tariffs.selectedTariffId);
                },
              ),
              children: notifier.tariffs.tariffs.map((tariff) {
                return CheckListTile(
                  title: tariff.name,
                  isSelected: notifier.tariffs.selectedTariffId == tariff.id,
                  onTap: () => notifier.selectTariff(tariff.id),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
