import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_tariffs_dialogs.dart';
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart';

class OrderSubmitTariffs extends StatelessWidget {
  final int tariffId;
  final SelectTariffsDialogs dialogs;

  const OrderSubmitTariffs({
    required this.tariffId,
    super.key,
  }) : dialogs = const SelectTariffsDialogs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffsBloc, TariffsState>(
      builder: (BuildContext context, TariffsState state) {
        final tileValue = state.tariff.findById(tariffId);

        return FieldListTile(
          label: 'Тариф',
          value: tileValue != null
              ? '${tileValue.name}, ${tileValue.description}'
              : null,
          onTap: () async {
            final selectedTariffId = await dialogs.toSelectTariffs(
              context,
              context.l10n.recipient,
              state.tariff.copyWith(
                selectedTariffId: tariffId,
              ),
            );
            if (selectedTariffId != null && context.mounted) {
              final field = UpdateOrdersTariffField(
                selectedTariffId,
              );
              context.read<CourierSubmitOrderBloc>().add(
                CourierSubmitOrderUpdateEvent(field),
              );
            }
          },
        );
      },
    );
  }
}
