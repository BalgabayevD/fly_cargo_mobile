import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/home_page_content_v2.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/choose_recipient_bottom_sheet.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/choose_tariff_bottom_sheet.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart'
    as destination;
import 'package:fly_cargo/features/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/choose_address_bottom_sheet.dart';
import 'package:fly_cargo/features/orders/domain/usecases/upload_order_photo_usecase.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart'
    as tariffs;
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrderPageV2 extends StatefulWidget {
  const CreateOrderPageV2({super.key});

  @override
  State<CreateOrderPageV2> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPageV2> {
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
  // ignore: unused_field
  String? _tariffName;
  double? _tariffWeight;
  tariffs.TariffModel? _selectedTariff;
  String? _description;
  // ignore: unused_field
  bool _isExpressDelivery = false;
  bool _isFragile = false;
  double? _customLength;
  double? _customWidth;
  double? _customHeight;
  final List<File> _photos = [];
  final Map<File, String> _photoIds = {};
  // ignore: unused_field
  DateTime? _deliveryDate;
  // ignore: unused_field
  double? _calculatedPrice;
  late final UploadOrderPhotoUseCase _uploadOrderPhotoUseCase;
  // ignore: unused_field
  PreCreateOrderData? _preOrderData;
  AnalysisStatus? _analysisStatus;
  bool _isAnalyzing = false;

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

  Future<void> _pickPhoto() async {
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
        _photos.add(photoFile);
      });

      try {
        final photoId = await _uploadOrderPhotoUseCase(photoFile);
        setState(() {
          _photoIds[photoFile] = photoId;
        });

        if (!_isAnalyzing) {
          _startAutoAnalysis();
        }
      } catch (e) {
        setState(() {
          _photos.remove(photoFile);
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

  void _removePhoto(File photo) {
    setState(() {
      _photos.remove(photo);
      _photoIds.remove(photo);
    });
  }

  Future<void> _startAutoAnalysis() async {
    if (_photos.isEmpty) {
      return;
    }

    setState(() {
      _isAnalyzing = true;
    });

    print('🚀 Запускаем анализ с ${_photos.length} фото');

    context.read<OrdersBloc>().add(
      PreCreateOrderEvent(images: _photos),
    );
  }

  void _submitOrder() {
    context.read<OrdersBloc>().add(
      SubmitOrderEvent(
        fromAddress: _fromAddress,
        toAddress: _toAddress,
        recipientName: _recipientName,
        recipientPhone: _recipientPhone,
        selectedTariffId: _selectedTariffId,
        selectedTariff: _selectedTariff,
        description: _description,
        isFragile: _isFragile,
        customLength: _customLength,
        customWidth: _customWidth,
        customHeight: _customHeight,
        photos: _photos,
        photoIds: _photoIds,
      ),
    );
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
          // Показываем индикатор загрузки
        } else if (state is OrdersUnauthorized) {
          setState(() {
            _isAnalyzing = false;
          });
          _showError('Для создания заказа необходимо войти в аккаунт');
        } else if (state is OrderValidationError) {
          _showError(state.message);
        } else if (state is OrdersError) {
          setState(() {
            _isAnalyzing = false;
          });
          _showError(state.message);
        } else if (state is PreOrderAnalyzed) {
          setState(() {
            _isAnalyzing = false;
            _preOrderData = state.preOrderData;
            _analysisStatus = state.analysisStatus;
            _description = state.preOrderData.description;
            _selectedTariffId = state.preOrderData.tariffId;
            _customLength = state.preOrderData.length.toDouble();
            _customWidth = state.preOrderData.width.toDouble();
            _customHeight = state.preOrderData.height.toDouble();
            _tariffWeight = state.preOrderData.weight;
          });

          // Показываем сообщение только если статус NONE (достаточно фото)
          if (state.analysisStatus == AnalysisStatus.none) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Анализ завершен! Данные заполнены автоматически',
                ),
                backgroundColor: AppColors.success,
              ),
            );
          }
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
            _photoIds.clear();
            _customLength = null;
            _customWidth = null;
            _customHeight = null;
            _deliveryDate = null;
            _calculatedPrice = null;
            _preOrderData = null;
            _analysisStatus = null;
            _isAnalyzing = false;
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
        body: HomePageContentV2(
          fromAddress: _fromAddress,
          toAddress: _toAddress,
          recipientName: _recipientName,
          recipientPhone: _recipientPhone,
          tariffWeight: _tariffWeight,
          description: _description,
          photos: _photos,
          onFromAddressSelection: _openFromAddressSelection,
          onToAddressSelection: _openToAddressSelection,
          onRecipientForm: _openRecipientForm,
          onDescriptionForm: _openDescriptionForm,
          onPickPhoto: _pickPhoto,
          onRemovePhoto: _removePhoto,
          onWeightTap: _openTariffSelection,
          onSubmitOrder: _submitOrder,
          isAnalyzing: _isAnalyzing,
          isAnalysisCompleted: _preOrderData != null,
          analysisStatus: _analysisStatus,
        ),
      ),
    );
  }
}
