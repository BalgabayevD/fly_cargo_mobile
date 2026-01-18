import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/create_orders_submit.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/photo_grid_section.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/photos_status_chip.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/select_location.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_recipient.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_tariffs.dart';

class CreateOrdersForm extends StatelessWidget {
  const CreateOrdersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PhotoGridSection(),
        BeSpace(size: .md),
        PhotosStatusChip(),
        BeSpace(size: .xxxl),
        SelectLocation(type: .from),
        BeSpace(size: .md),
        SelectLocation(type: .to),
        BeSpace(size: .md),
        SelectRecipient(),
        BeSpace(size: .xxxl),
        SelectTariffs(),
        BeSpace(size: .md),
        BeFormInput(
          keyboardType: .numberWithOptions(decimal: true),
          label: context.l10n.weightInKg,
        ),
        BeSpace(size: .md),
        BeFormInput(
          label: context.l10n.description,
        ),
        BeSpace(size: .xxxl),
        CreateOrdersSubmitButton(),
        BeSpace(size: .xxxl),
      ],
    );
  }
}
