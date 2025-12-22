import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/home/presentation/widgets/choose_recipient_bottom_sheet.dart';
import 'package:fly_cargo/features/home/presentation/widgets/choose_tariff_bottom_sheet.dart';
import 'package:fly_cargo/features/home/presentation/widgets/home_page_content.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart'
    as destination;
import 'package:fly_cargo/shared/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/choose_address_bottom_sheet.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/upload_order_photo_usecase.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart'
    as tariffs;
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  void initState() {
    super.initState();
    _uploadOrderPhotoUseCase = getIt<UploadOrderPhotoUseCase>();
  }

  destination.AddressModel? _fromAddress;
  destination.AddressModel? _toAddress;
  String? _recipientName;
  String? _recipientPhone;
  int? _selectedTariffId;
  String? _tariffName;
  double? _tariffWeight;
  tariffs.TariffModel? _selectedTariff;
  String? _description;
  bool _isExpressDelivery = false;
  bool _isFragile = false;
  double? _customLength;
  double? _customWidth;
  double? _customHeight;
  final List<File> _photos = [];
  final List<File> _contentPhotos = [];
  final Map<File, String> _photoIds = {};
  final Map<File, String> _contentPhotoIds = {};
  DateTime? _deliveryDate;
  double? _calculatedPrice;
  late final UploadOrderPhotoUseCase _uploadOrderPhotoUseCase;

  Future<void> _openFromAddressSelection() async {
    final address = await showModalBottomSheet<destination.AddressModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: _fromAddress != null
            ? destination.CityModel(
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
        SnackBar(
          content: Text('Сначала выберите город отправки'),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    final address = await showModalBottomSheet<destination.AddressModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAddressBottomSheet(
        initialCity: _toAddress != null
            ? destination.CityModel(
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
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseRecipientBottomSheet(
        initialName: _recipientName,
        initialPhone: _recipientPhone,
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
    final result = await context.push<String>(
      '${AppRoutes.home}/${AppRoutes.descriptionForm}',
      extra: _description,
    );

    if (result != null) {
      setState(() {
        _description = result;
      });
    }
  }

  Future<void> _openTariffSelection() async {
    final selectedTariff = _selectedTariffId != null ? null : null;

    final result = await showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseTariffBottomSheet(
        initialTariff: selectedTariff,
      ),
    );

    if (result != null) {
      if (result is tariffs.TariffModel) {
        setState(() {
          _selectedTariff = result;
          _selectedTariffId = result.id;
          _tariffName = result.name;
          _tariffWeight = result.weight;
          _customLength = null;
          _customWidth = null;
          _customHeight = null;
        });
        _recalculatePriceIfPossible();
      } else if (result is Map && result.containsKey('customDimensions')) {
        final dimensions = result['customDimensions'] as Map<String, double>;
        setState(() {
          _customLength = dimensions['length'];
          _customWidth = dimensions['width'];
          _customHeight = dimensions['height'];
        });
      }
    }
  }

  Future<void> _pickPhoto({bool isContent = false}) async {
    // Показываем диалог выбора источника
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Выберите источник',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.surface5,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.primary),
                title: Text('Камера'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.primary),
                title: Text('Галерея'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );

    if (source == null) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final photoFile = File(image.path);
      setState(() {
        if (isContent) {
          _contentPhotos.add(photoFile);
        } else {
          _photos.add(photoFile);
        }
      });

      try {
        final photoId = await _uploadOrderPhotoUseCase(photoFile);
        setState(() {
          if (isContent) {
            _contentPhotoIds[photoFile] = photoId;
          } else {
            _photoIds[photoFile] = photoId;
          }
        });
      } catch (e) {
        setState(() {
          if (isContent) {
            _contentPhotos.remove(photoFile);
          } else {
            _photos.remove(photoFile);
          }
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при загрузке фото: $e'),
              backgroundColor: AppColors.danger,
            ),
          );
        }
      }
    }
  }

  void _removePhoto(File photo, {bool isContent = false}) {
    setState(() {
      if (isContent) {
        _contentPhotos.remove(photo);
        _contentPhotoIds.remove(photo);
      } else {
        _photos.remove(photo);
        _photoIds.remove(photo);
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

    if (_selectedTariffId == null || _selectedTariff == null) {
      _showError('Выберите тариф');
      return;
    }

    if (_description == null || _description!.isEmpty) {
      _showError('Укажите описание посылки');
      return;
    }

    // Проверка размеров тарифа
    // final height = _customHeight ?? _selectedTariff!.height;
    final length = _customLength ?? _selectedTariff!.length;
    final width = _customWidth ?? _selectedTariff!.width;

    // if (height == null || height <= 0 ||
    //     length == null || length <= 0 ||
    //     width == null || width <= 0) {
    //   _showError('Выбранный тариф не содержит корректных размеров. Пожалуйста, выберите другой тариф или укажите размеры вручную.');
    //   return;
    // }

    final photoIds = _photos
        .map((photo) => _photoIds[photo] ?? '')
        .where((id) => id.isNotEmpty)
        .toList();
    final contentPhotoIds = _contentPhotos
        .map((photo) => _contentPhotoIds[photo] ?? '')
        .where((id) => id.isNotEmpty)
        .toList();

    final orderData = OrderData(
      isDefect: false,
      isFragile: _isFragile,
      comment: '',
      contentPhotos: contentPhotoIds,
      description: _description!,
      fromAddress: _fromAddress!.fullAddress ?? _fromAddress!.address,
      fromApartment: _fromAddress!.apartment ?? '',
      fromCityId: int.tryParse(_fromAddress!.cityId) ?? 0,
      fromEntrance: _fromAddress!.entrance ?? '',
      fromFloor: _fromAddress!.floor?.isNotEmpty == true
          ? _fromAddress!.floor
          : null,
      height: _customHeight ?? _selectedTariff!.height ?? 0.0,
      length: length ?? 0.0,
      photos: photoIds,
      tariffId: _selectedTariffId!,
      toAddress: _toAddress!.fullAddress ?? _toAddress!.address,
      toApartment: _toAddress!.apartment ?? '',
      toCityId: int.tryParse(_toAddress!.cityId) ?? 0,
      toEntrance: _toAddress!.entrance ?? '',
      toFloor: _toAddress!.floor?.isNotEmpty == true ? _toAddress!.floor : null,
      toName: _recipientName!,
      toPhone: _recipientPhone!,
      volumetricWeight: _selectedTariff!.volumetricWeight,
      weight: _selectedTariff!.weight ?? 0.0,
      width: width ?? 0.0,
    );

    context.read<OrdersBloc>().add(CreateOrderEvent(orderData: orderData));
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.danger,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is OrdersLoading) {
        } else if (state is OrdersUnauthorized) {
          _showError('Для создания заказа необходимо войти в аккаунт');
        } else if (state is OrdersError) {
          _showError(state.message);
        } else if (state is OrderCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Заказ #${state.orderResult.orderId} создан успешно!',
              ),
              backgroundColor: AppColors.success,
            ),
          );
          setState(() {
            _fromAddress = null;
            _toAddress = null;
            _recipientName = null;
            _recipientPhone = null;
            _selectedTariffId = null;
            _tariffName = null;
            _tariffWeight = null;
            _selectedTariff = null;
            _description = null;
            _isExpressDelivery = false;
            _isFragile = false;
            _photos.clear();
            _contentPhotos.clear();
            _photoIds.clear();
            _contentPhotoIds.clear();
            _customLength = null;
            _customWidth = null;
            _customHeight = null;
            _deliveryDate = null;
            _calculatedPrice = null;
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            'Главная',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.surface5,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: HeroIcon(
                HeroIcons.questionMarkCircle,
                size: 24,
                color: AppColors.surface4,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
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
      ),
    );
  }
}
