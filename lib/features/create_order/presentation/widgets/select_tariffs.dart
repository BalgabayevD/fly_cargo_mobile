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
    return BlocBuilder<TariffsBloc, TariffsState>(
      builder: (BuildContext context, TariffsState state) {
        return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
          builder: (BuildContext context, CreateOrdersState ordersState) {
            if (state is TariffsLoadedState &&
                ordersState is CreateOrdersCreateState) {
              final tileValue = state.tariff.findById(
                ordersState.data.tariffId,
              );

              return FieldListTile(
                label: 'Тариф',
                value: tileValue != null
                    ? '${tileValue.name}, ${tileValue.description}'
                    : null,
                onTap: () async {
                  final tariffId = await dialogs.toSelectTariffs(
                    context,
                    context.l10n.recipient,
                    state.tariff,
                  );
                  if (tariffId != null && context.mounted) {
                    final field = UpdateOrdersTariffField(
                      tariffId,
                    );
                    context.read<CreateOrdersBloc>().add(
                      UpdateOrdersCreateEvent(field),
                    );
                  }
                },
              );
            }
            return FieldListTile(label: 'Тариф', disabled: true);
          },
        );
      },
    );
  }
}
