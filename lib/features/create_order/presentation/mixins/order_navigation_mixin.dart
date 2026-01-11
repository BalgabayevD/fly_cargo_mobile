import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart'
    as destination;
import 'package:fly_cargo/features/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/choose_address_bottom_sheet.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/choose_recipient_bottom_sheet.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/choose_tariff_bottom_sheet.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart'
    as tariffs;
import 'package:go_router/go_router.dart';

mixin OrderNavigationMixin<T extends StatefulWidget> on State<T> {
  destination.AddressModel? get fromAddress;
  destination.AddressModel? get toAddress;
  String? get recipientName;
  String? get recipientPhone;
  int? get selectedTariffId;
  String? get description;

  void updateFromAddress(destination.AddressModel? address);
  void updateToAddress(destination.AddressModel? address);
  void updateRecipient(String? name, String? phone);
  void updateDescription(String? desc);
  void updateTariff(tariffs.TariffModel tariff);
  void updateCustomDimensions(double? length, double? width, double? height);
  void recalculatePrice();

  Future<void> openFromAddressSelection() async {
    final address = await showModalBottomSheet<destination.AddressModel>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: fromAddress != null
            ? destination.CityModel(
                id: fromAddress!.cityId,
                name: fromAddress!.city,
              )
            : null,
        initialAddress: fromAddress,
        title: 'Откуда',
        cityType: CityType.from,
      ),
    );
    if (address != null) {
      updateFromAddress(address);
      recalculatePrice();
    }
  }

  Future<void> openToAddressSelection() async {
    if (fromAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Сначала выберите город отправки'),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    final address = await showModalBottomSheet<destination.AddressModel>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: toAddress != null
            ? destination.CityModel(
                id: toAddress!.cityId,
                name: toAddress!.city,
              )
            : null,
        initialAddress: toAddress,
        title: 'Куда',
        cityType: CityType.to,
        fromCityId: fromAddress!.cityId,
      ),
    );
    if (address != null) {
      updateToAddress(address);
      recalculatePrice();
    }
  }

  Future<void> openRecipientForm() async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseRecipientBottomSheet(
        initialName: recipientName,
        initialPhone: recipientPhone,
      ),
    );

    if (result != null) {
      updateRecipient(result['name'], result['phone']);
      recalculatePrice();
    }
  }

  Future<void> openDescriptionForm() async {
    final result = await context.push<String>(
      '${AppRoutes.home}/${AppRoutes.descriptionForm}',
      extra: description,
    );

    if (result != null) {
      updateDescription(result);
    }
  }

  Future<void> openTariffSelection() async {
    final result = await showModalBottomSheet<dynamic>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseTariffBottomSheet(
        initialTariff: null,
      ),
    );

    if (result != null) {
      if (result is tariffs.TariffModel) {
        updateTariff(result);
        recalculatePrice();
      } else if (result is Map && result.containsKey('customDimensions')) {
        final dimensions = result['customDimensions'] as Map<String, double>;
        updateCustomDimensions(
          dimensions['length'],
          dimensions['width'],
          dimensions['height'],
        );
      }
    }
  }

  void recalculatePriceIfPossible() {
    if (selectedTariffId != null && fromAddress != null && toAddress != null) {
      final fromCityId = int.tryParse(fromAddress!.cityId);
      final toCityId = int.tryParse(toAddress!.cityId);

      if (fromCityId != null && toCityId != null) {
        context.read<PriceCalculationBloc>().add(
              CalculatePriceEvent(
                tariffId: selectedTariffId!,
                fromCityId: fromCityId,
                toCityId: toCityId,
                toPhone: recipientPhone ?? '+77777777777',
              ),
            );
      }
    }
  }
}

