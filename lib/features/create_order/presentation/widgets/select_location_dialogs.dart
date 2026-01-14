import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/address_select_field.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';

class SelectLocationDialogs {
  const SelectLocationDialogs();

  void toSelectAddress(
    BuildContext context,
    String text,
    LocationsEntity? location,
  ) {
    BeBottomDialog.showBottomDialog<LocationsEntity>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      text: text,
      action: BeButton(
        text: 'Сохранить',
      ),
      children: [
        Column(
          children: [
            _DialogCitySelect(
              location: location,
              completions: ['1', '2', '3'],
            ),
            BeSpace(size: .md),
            _DialogAddressSelect(
              location: location,
              completions: ['1', '2', '3'],
            ),
            BeSpace(size: .md),
            _DialogApartmentSelect(),
          ],
        ),
      ],
    );
  }
}

class LocationEditDialog extends StatefulWidget {
  final LocationsEntity? location;
  final void Function(LocationsEntity? location)? onChange;
  const LocationEditDialog({
    super.key,
    this.location,
    this.onChange,
  });

  @override
  State<LocationEditDialog> createState() => _LocationEditDialogState();
}

class _LocationEditDialogState extends State<LocationEditDialog> {
  late LocationsEntity? location = widget.location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DialogCitySelect(
          location: location,
          completions: ['1', '2', '3'],
        ),
        BeSpace(size: .md),
        _DialogAddressSelect(
          location: location,
          completions: ['1', '2', '3'],
        ),
        BeSpace(size: .md),
        _DialogApartmentSelect(
          location: location,
          onChange: (value) {
            location = value;
            setState(() {});
          },
        ),
      ],
    );
  }
}

class _DialogCitySelect extends StatefulWidget {
  final List<String>? completions;
  final LocationsEntity? location;
  final void Function(LocationsEntity? location)? onChange;

  const _DialogCitySelect({this.location, this.completions, this.onChange});

  @override
  State<_DialogCitySelect> createState() => _DialogCitySelectState();
}

class _DialogCitySelectState extends State<_DialogCitySelect> {
  late LocationsEntity? location = widget.location;

  @override
  Widget build(BuildContext context) {
    return FieldListTile(
      label: context.l10n.city,
      value: location?.city?.name,
      variant: .bordered,
      isShowIcon: false,
      onTap: () {
        BeBottomDialog.showBottomDialog(
          context: context,
          text: context.l10n.city,
          titleVariant: .secondary,
          maxChildSize: 0.90,
          initialChildSize: 0.90,
          minChildSize: 0.85,
          action: BeButton(
            text: 'Сохранить',
            onPressed: () {
              if (widget.onChange != null) {
                widget.onChange!(location);
              }
            },
          ),
          children: [
            AddressSelectField(
              label: context.l10n.city,
              readOnly: true,
              autofocus: true,
              value: location?.city?.name,
              autoSelect: true,
              completions: widget.completions,
            ),
          ],
        );
      },
    );
  }
}

class _DialogAddressSelect extends StatefulWidget {
  final List<String>? completions;
  final LocationsEntity? location;
  final void Function(LocationsEntity? location)? onChange;

  const _DialogAddressSelect({this.location, this.completions, this.onChange});

  @override
  State<_DialogAddressSelect> createState() => _DialogAddressSelectState();
}

class _DialogAddressSelectState extends State<_DialogAddressSelect> {
  late LocationsEntity? location = widget.location;

  @override
  Widget build(BuildContext context) {
    return FieldListTile(
      label: context.l10n.address,
      value: location?.address,
      variant: .bordered,
      isShowIcon: false,
      onTap: () {
        BeBottomDialog.showBottomDialog(
          context: context,
          text: context.l10n.address,
          titleVariant: .secondary,
          maxChildSize: 0.90,
          initialChildSize: 0.90,
          minChildSize: 0.85,
          action: BeButton(
            text: 'Выбрать',
            onPressed: () {
              if (widget.onChange != null) {
                widget.onChange!(location);
              }
            },
          ),
          children: [
            AddressSelectField(
              label: context.l10n.address,
              autofocus: true,
              value: location?.address,
              autoSelect: true,
            ),
          ],
        );
      },
    );
  }
}

class _DialogApartmentSelect extends StatefulWidget {
  final LocationsEntity? location;
  final void Function(LocationsEntity? location)? onChange;

  const _DialogApartmentSelect({this.location, this.onChange});

  @override
  State<_DialogApartmentSelect> createState() => _DialogApartmentSelectState();
}

class _DialogApartmentSelectState extends State<_DialogApartmentSelect> {
  late LocationsEntity? location = widget.location;

  @override
  Widget build(BuildContext context) {
    return BeFormInput(
      variant: .bordered,
      label: context.l10n.apartment,
    );
  }
}
