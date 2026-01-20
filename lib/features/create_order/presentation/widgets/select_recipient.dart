import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/enitites/recipient_entity.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_recipient_dialogs.dart';

class SelectRecipient extends StatelessWidget {
  final SelectRecipientDialogs _dialogs;
  const SelectRecipient({
    super.key,
  }) : _dialogs = const SelectRecipientDialogs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      buildWhen: (previous, state) =>
          (previous.data.toName != state.data.toName ||
              previous.data.toPhone != state.data.toPhone) ||
          state.errors['toName'] != null ||
          state.errors['toPhone'] != null,
      builder: (BuildContext context, CreateOrdersState state) {
        return FieldListTile(
          label: context.l10n.recipient,
          errors: [state.errors['toPhone'], state.errors['toName']],
          value: _value(state.data.toName, state.data.toPhone),
          onTap: () => _onTap(context, state.data),
        );
      },
    );
  }

  String? _value(String name, String phone) {
    final parts = <String>[
      if (name.isNotEmpty) name,
      if (phone.isNotEmpty) phone,
    ];
    if (parts.isNotEmpty) {
      return parts.join(', ');
    }
    return null;
  }

  Future<void> _onTap(
    BuildContext context,
    dynamic orderData,
  ) async {
    final recipient = await _dialogs.toSelectRecipient(
      context,
      context.l10n.recipient,
      RecipientEntity(
        name: orderData.toName,
        phone: orderData.toPhone,
      ),
    );

    if (recipient == null || !context.mounted) return;

    context.read<CreateOrdersBloc>().add(
      UpdateOrdersCreateEvent(
        UpdateOrdersRecipientField(
          recipient.name,
          recipient.phone,
        ),
      ),
    );
  }
}
