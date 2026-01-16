import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/enitites/recipient_entity.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_recipient_dialogs.dart';

class SelectRecipient extends StatelessWidget {
  final SelectRecipientDialogs dialogs;
  const SelectRecipient({
    super.key,
  }) : dialogs = const SelectRecipientDialogs();

  @override
  Widget build(BuildContext context) {
    return FieldListTile(
      label: context.l10n.recipient,
      value: '22',
      onTap: () async {
        final a = await dialogs.toSelectRecipient(
          context,
          context.l10n.recipient,
            RecipientEntity(),
        );
        print(a);
      },
    );
  }
}
