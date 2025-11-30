import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/pages/description_form_page.dart';
import 'package:fly_cargo/features/home/presentation/pages/recipient_form_page.dart';
import 'package:fly_cargo/features/home/presentation/tariff_details_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/home_page_content.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/choose_address_bottom_sheet.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

/// Главная страница с формой создания заказа
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AddressModel? _fromAddress;
  AddressModel? _toAddress;
  String? _recipientName;
  String? _recipientPhone;
  int? _selectedTariffId;
  String? _tariffName;
  double? _tariffWeight;
  String? _description;
  bool _isExpressDelivery = false;
  bool _isFragile = false;
  final List<File> _photos = [];
  final List<File> _contentPhotos = [];
  DateTime? _deliveryDate;
  double? _calculatedPrice;

  Future<void> _openFromAddressSelection() async {
    final address = await showModalBottomSheet<AddressModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: _fromAddress != null
            ? CityModel(
                id: _fromAddress!.cityId,
                name: _fromAddress!.city,
              )
            : null,
        initialAddress: _fromAddress,
        title: 'Откуда',
        cityType: CityType.from,
      ),
    );
    if (address != null) {
      setState(() {
        _fromAddress = address;
      });
      _recalculatePriceIfPossible();
    }
  }

  Future<void> _openToAddressSelection() async {
    if (_fromAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала выберите город отправки'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    final address = await showModalBottomSheet<AddressModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: _toAddress != null
            ? CityModel(
                id: _toAddress!.cityId,
                name: _toAddress!.city,
              )
            : null,
        initialAddress: _toAddress,
        title: 'Куда',
        cityType: CityType.to,
        fromCityId: _fromAddress!.cityId,
      ),
    );
    if (address != null) {
      setState(() {
        _toAddress = address;
      });
      _recalculatePriceIfPossible();
    }
  }

  void _recalculatePriceIfPossible() {
    if (_selectedTariffId != null &&
        _fromAddress != null &&
        _toAddress != null) {
      final fromCityId = int.tryParse(_fromAddress!.cityId);
      final toCityId = int.tryParse(_toAddress!.cityId);

      if (fromCityId != null && toCityId != null) {
        context.read<PriceCalculationBloc>().add(
          CalculatePriceEvent(
            tariffId: _selectedTariffId!,
            fromCityId: fromCityId,
            toCityId: toCityId,
            toPhone: _recipientPhone ?? '+77777777777',
          ),
        );
      }
    }
  }

  Future<void> _openRecipientForm() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => RecipientFormPage(
          initialName: _recipientName,
          initialPhone: _recipientPhone,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _recipientName = result['name'];
        _recipientPhone = result['phone'];
      });
      _recalculatePriceIfPossible();
    }
  }

  Future<void> _openDescriptionForm() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionFormPage(
          initialDescription: _description,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _description = result;
      });
    }
  }

  void _openTariffSelection() {
    if (_fromAddress == null || _toAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала укажите адреса отправки и доставки'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final tariffState = context.read<TariffSelectionBloc>().state;
    if (tariffState is TariffSelectionLoaded) {
      final categories = tariffState.categories;
      if (categories.isNotEmpty &&
          categories.first.tariffs != null &&
          categories.first.tariffs!.isNotEmpty) {
        final tariff = categories.first.tariffs!.first;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TariffDetailsPage(
              tariffId: tariff.id,
              fromAddress: _fromAddress,
              toAddress: _toAddress,
            ),
          ),
        ).then((result) {
          if (result != null && result is Map) {
            setState(() {
              _selectedTariffId = result['tariffId'];
              _tariffName = result['tariffName'];
              _tariffWeight = result['weight'];
            });
            _recalculatePriceIfPossible();
          }
        });
      }
    }
  }

  Future<void> _pickPhoto({bool isContent = false}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        if (isContent) {
          _contentPhotos.add(File(image.path));
        } else {
          _photos.add(File(image.path));
        }
      });
    }
  }

  void _removePhoto(File photo, {bool isContent = false}) {
    setState(() {
      if (isContent) {
        _contentPhotos.remove(photo);
      } else {
        _photos.remove(photo);
      }
    });
  }

  void _submitOrder() {
    if (_fromAddress == null || _toAddress == null) {
      _showError('Укажите адреса отправки и доставки');
      return;
    }

    if (_recipientName == null || _recipientPhone == null) {
      _showError('Укажите данные получателя');
      return;
    }

    if (_selectedTariffId == null) {
      _showError('Выберите тариф');
      return;
    }

    if (_description == null || _description!.isEmpty) {
      _showError('Укажите описание посылки');
      return;
    }

    // TODO: Создание заказа
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Функция создания заказа в разработке'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Главная',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const HeroIcon(
              HeroIcons.questionMarkCircle,
              size: 24,
              color: AppColors.textSecondary,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Справка в разработке'),
                ),
              );
            },
          ),
        ],
      ),
      body: HomePageContent(
        fromAddress: _fromAddress,
        toAddress: _toAddress,
        recipientName: _recipientName,
        recipientPhone: _recipientPhone,
        tariffName: _tariffName,
        tariffWeight: _tariffWeight,
        description: _description,
        isExpressDelivery: _isExpressDelivery,
        isFragile: _isFragile,
        photos: _photos,
        contentPhotos: _contentPhotos,
        deliveryDate: _deliveryDate,
        calculatedPrice: _calculatedPrice,
        onFromAddressSelection: _openFromAddressSelection,
        onToAddressSelection: _openToAddressSelection,
        onRecipientForm: _openRecipientForm,
        onTariffSelection: _openTariffSelection,
        onDescriptionForm: _openDescriptionForm,
        onToggleExpress: () {
          setState(() {
            _isExpressDelivery = !_isExpressDelivery;
          });
        },
        onToggleFragile: () {
          setState(() {
            _isFragile = !_isFragile;
          });
        },
        onPickPhoto: () => _pickPhoto(isContent: false),
        onPickContentPhoto: () => _pickPhoto(isContent: true),
        onRemovePhoto: (photo) => _removePhoto(photo, isContent: false),
        onRemoveContentPhoto: (photo) => _removePhoto(photo, isContent: true),
        onSubmitOrder: _submitOrder,
        onInfoLink: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Информация о товарах в разработке'),
            ),
          );
        },
      ),
    );
  }
}
