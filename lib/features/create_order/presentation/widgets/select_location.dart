import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_dialogs.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_type.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';

class SelectLocation extends StatelessWidget {
  final LocationsEntity? location;
  final void Function(LocationsEntity location)? onChange;
  final SelectLocationDialogs showDialog;
  final SelectLocationType type;

  const SelectLocation({
    required this.type,
    super.key,
    this.location,
    this.onChange,
  }) : showDialog = const SelectLocationDialogs();

  @override
  Widget build(BuildContext context) {
    final label = type == SelectLocationType.from
        ? context.l10n.from
        : context.l10n.to;

    return FieldListTile(
      label: label,
      value: location?.listTileLabel,
      onTap: () {
        showDialog.toSelectAddress(
          context,
          label,
          location,
        );
      },
    );
  }
}
