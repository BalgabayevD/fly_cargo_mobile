import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_tariffs_dialogs.dart';

class SelectTariffs extends StatelessWidget {
  final SelectTariffsDialogs dialogs;
  const SelectTariffs({
    super.key,
  }) : dialogs = const SelectTariffsDialogs();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TariffsBloc, TariffsState>(
      listener: (BuildContext context, TariffsState state) {
        if (state is TariffsLoadedState &&
            state.tariff.selectedTariffId != null) {
          final field = UpdateOrdersTariffField(
            state.tariff.selectedTariffId!,
          );
          context.read<CreateOrdersBloc>().add(UpdateOrdersCreateEvent(field));
        }
      },
      listenWhen: (TariffsState prev, TariffsState state) {
        if (prev is TariffsLoadedState && state is TariffsLoadedState) {
          return prev.tariff.selectedTariffId != state.tariff.selectedTariffId;
        }

        return false;
      },
      builder: (context, state) {
        if (state is TariffsLoadedState) {
          return FieldListTile(
            label: 'Тариф',
            value: state.tariff.listTileLabel,
            onTap: () async {
              final tariff = await dialogs.toSelectTariffs(
                context,
                context.l10n.recipient,
                state.tariff,
              );
              if (tariff != null && context.mounted) {
                context.read<TariffsBloc>().add(
                  TariffsSelectTariffEvent(tariff),
                );
              }
            },
          );
        }

        return FieldListTile(label: 'Тариф', disabled: true);
      },
    );
  }
}
