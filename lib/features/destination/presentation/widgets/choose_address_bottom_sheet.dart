import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/destination_bloc.dart';
import 'package:fly_cargo/features/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/address_autocomplete_field.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/address_form_fields.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/choose_city_bottom_sheet.dart';

class ChooseAddressBottomSheet extends StatefulWidget {
  final CityModel? initialCity;
  final String? title;
  final AddressModel? initialAddress;
  final CityType cityType;
  final String? fromCityId;

  const ChooseAddressBottomSheet({
    this.initialCity,
    this.title,
    this.initialAddress,
    this.cityType = CityType.from,
    this.fromCityId,
    super.key,
  });

  @override
  State<ChooseAddressBottomSheet> createState() =>
      _ChooseAddressBottomSheetState();
}

class _ChooseAddressBottomSheetState extends State<ChooseAddressBottomSheet> {
  CityModel? _selectedCity;
  late final TextEditingController _addressController;
  late final TextEditingController _apartmentController;
  late final TextEditingController _entranceController;
  late final TextEditingController _floorController;

  @override
  void initState() {
    super.initState();
    _selectedCity =
        widget.initialCity ??
        (widget.initialAddress != null
            ? CityModel(
                id: widget.initialAddress!.cityId,
                name: widget.initialAddress!.city,
              )
            : null);
    _addressController = TextEditingController(
      text: widget.initialAddress?.address ?? '',
    );
    _apartmentController = TextEditingController(
      text:
          widget.initialAddress?.fullAddress
              ?.split(', ')
              .firstWhere(
                (part) => part.toLowerCase().contains('кв'),
                orElse: () => '',
              ) ??
          '',
    );
    _entranceController = TextEditingController(
      text:
          widget.initialAddress?.fullAddress
              ?.split(', ')
              .firstWhere(
                (part) => part.toLowerCase().contains('подъезд'),
                orElse: () => '',
              ) ??
          '',
    );
    _floorController = TextEditingController(
      text:
          widget.initialAddress?.fullAddress
              ?.split(', ')
              .firstWhere(
                (part) => part.toLowerCase().contains('этаж'),
                orElse: () => '',
              ) ??
          '',
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _apartmentController.dispose();
    _entranceController.dispose();
    _floorController.dispose();
    super.dispose();
  }

  String get _title {
    return widget.title ?? 'Откуда';
  }

  Future<void> _selectCity() async {
    final city = await BeBottomDialog.showBottomDialog<CityModel>(
      context: context,
      text: 'Откуда',
      maxChildSize: 0.7,
      initialChildSize: 0.7,
      titleVariant: .secondary,
      children: [
        ChooseCityBottomSheet(
          cityType: widget.cityType,
          fromCityId: widget.fromCityId,
          title: widget.title,
        ),
      ],
    );
    if (city != null) {
      setState(() {
        _selectedCity = city;
      });
    }
  }

  void _onSave() {
    if (_selectedCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.chooseCity),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }

    final address = _addressController.text.trim();
    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.enterAddressField),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }

    final parts = <String>[];
    if (_apartmentController.text.trim().isNotEmpty) {
      parts.add('Кв. ${_apartmentController.text.trim()}');
    }
    if (_entranceController.text.trim().isNotEmpty) {
      parts.add('Подъезд ${_entranceController.text.trim()}');
    }
    if (_floorController.text.trim().isNotEmpty) {
      parts.add('Этаж ${_floorController.text.trim()}');
    }

    final fullAddress = parts.isEmpty
        ? address
        : '$address, ${parts.join(', ')}';

    final addressModel = AddressModel(
      city: _selectedCity!.name,
      address: address,
      cityId: _selectedCity!.id,
      fullAddress: fullAddress,
      apartment: _apartmentController.text.trim().isNotEmpty
          ? _apartmentController.text.trim()
          : null,
      entrance: _entranceController.text.trim().isNotEmpty
          ? _entranceController.text.trim()
          : null,
      floor: _floorController.text.trim().isNotEmpty
          ? _floorController.text.trim()
          : null,
    );

    Navigator.pop(context, addressModel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FieldListTile(
          variant: .bordered,
          label: context.l10n.city,
          value: _selectedCity != null
              ? 'г. ${_selectedCity!.name}'
              : context.l10n.selectCity,
          onTap: _selectCity,
        ),
        const SizedBox(height: AppSpacing.lg),
        BlocProvider.value(
          value: getIt<DestinationBloc>(),
          child: AddressAutocompleteField(
            label: context.l10n.address,
            controller: _addressController,
            hintText: context.l10n.enterAddressPlaceholder,
            cityName: _selectedCity?.name,
            onAddressSelected: (address) {
              setState(() {
                _addressController.text = address.address;
              });
            },
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        AddressTextField(
          label: context.l10n.apartment,
          controller: _apartmentController,
          hintText: context.l10n.apartmentNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSpacing.lg),
        AddressTextField(
          label: context.l10n.entrance,
          controller: _entranceController,
          hintText: context.l10n.entranceNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSpacing.lg),
        AddressTextField(
          label: context.l10n.floor,
          controller: _floorController,
          hintText: context.l10n.floorNumber,
          keyboardType: TextInputType.number,
        ),
        BeSpace(size: .md),
        BeButton(
          text: context.l10n.save,
          onPressed: _onSave,
        ),
        BeSpace(size: .lg),
      ],
    );
  }
}
