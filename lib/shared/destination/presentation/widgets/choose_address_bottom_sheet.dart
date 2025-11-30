import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/address_form_fields.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/choose_city_bottom_sheet.dart';
import 'package:heroicons/heroicons.dart';

/// Bottom sheet для ввода адреса с полями квартиры, подъезда, этажа
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
    _selectedCity = widget.initialCity ??
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
      text: widget.initialAddress?.fullAddress?.split(', ').firstWhere(
                (part) => part.toLowerCase().contains('кв'),
                orElse: () => '',
              ) ??
          '',
    );
    _entranceController = TextEditingController(
      text: widget.initialAddress?.fullAddress?.split(', ').firstWhere(
                (part) => part.toLowerCase().contains('подъезд'),
                orElse: () => '',
              ) ??
          '',
    );
    _floorController = TextEditingController(
      text: widget.initialAddress?.fullAddress?.split(', ').firstWhere(
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
    final city = await showModalBottomSheet<CityModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseCityBottomSheet(
        cityType: widget.cityType,
        fromCityId: widget.fromCityId,
        title: widget.title,
      ),
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
        const SnackBar(
          content: Text('Выберите город'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final address = _addressController.text.trim();
    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Введите адрес'),
          backgroundColor: AppColors.error,
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
    );

    Navigator.pop(context, addressModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Заголовок с кнопкой закрытия
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _title,
                    style: AppTypography.h5,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: const HeroIcon(
                    HeroIcons.xMark,
                    size: 24,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Поля ввода
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Город (кликабельный)
                  ReadOnlyAddressField(
                    label: 'Город',
                    value: _selectedCity != null
                        ? 'г. ${_selectedCity!.name}'
                        : 'Выберите город',
                    onTap: _selectCity,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Адрес
                  AddressTextField(
                    label: 'Адрес',
                    controller: _addressController,
                    hintText: 'Введите адрес',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Квартира
                  AddressTextField(
                    label: 'Квартира',
                    controller: _apartmentController,
                    hintText: 'Номер квартиры',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Подъезд
                  AddressTextField(
                    label: 'Подъезд',
                    controller: _entranceController,
                    hintText: 'Номер подъезда',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Этаж
                  AddressTextField(
                    label: 'Этаж',
                    controller: _floorController,
                    hintText: 'Номер этажа',
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          // Кнопка "Сохранить"
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              top: AppSpacing.lg,
              bottom: 56,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.lg,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                ),
                child: Text(
                  'Сохранить',
                  style: AppTypography.buttonLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

