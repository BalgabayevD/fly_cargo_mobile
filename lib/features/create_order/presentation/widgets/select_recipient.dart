import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/enitites/recipient_entity.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_recipient_dialogs.dart';

class SelectRecipient extends StatelessWidget {
  final SelectRecipientDialogs dialogs;
  const SelectRecipient({
    super.key,
  }) : dialogs = const SelectRecipientDialogs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      builder: (BuildContext context, CreateOrdersState state) {
        if (state is CreateOrdersCreateState) {
          return FieldListTile(
            label: context.l10n.recipient,
            value: [
              if (state.data.toName.isNotEmpty) state.data.toName,
              if (state.data.toPhone.isNotEmpty) state.data.toPhone,
            ].join(', '),
            onTap: () async {
              final recipient = await dialogs.toSelectRecipient(
                context,
                context.l10n.recipient,
                RecipientEntity(
                  name: state.data.toName,
                  phone: state.data.toPhone,
                ),
              );

              if (recipient != null && context.mounted) {
                final field = UpdateOrdersRecipientField(
                  recipient.name,
                  recipient.phone,
                );
                context.read<CreateOrdersBloc>().add(
                  UpdateOrdersCreateEvent(field),
                );
              }
            },
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
