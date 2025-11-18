import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/create_tariff_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/tariff_characteristics_card.dart';
import 'package:fly_cargo/features/home/presentation/widgets/tariff_image_header.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_creation_form.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';

class TariffDetailsPage extends StatelessWidget {
  final int tariffId;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const TariffDetailsPage({
    required this.tariffId,
    super.key,
    this.fromAddress,
    this.toAddress,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
      builder: (context, state) {
        if (state is TariffSelectionLoaded) {
          dynamic selectedTariff;
          for (final category in state.categories) {
            if (category.tariffs != null) {
              for (final tariff in category.tariffs!) {
                if (tariff.id == tariffId) {
                  selectedTariff = tariff;
                  break;
                }
              }
            }
            if (selectedTariff != null) break;
          }

          if (selectedTariff == null) {
            return const _TariffNotFoundScreen();
          }

          return TariffDetailsContent(
            tariff: selectedTariff,
            fromAddress: fromAddress,
            toAddress: toAddress,
          );
        }

        if (state is TariffSelectionError) {
          return _TariffErrorScreen(message: state.message);
        }

        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

/// Экран "Тариф не найден"
class _TariffNotFoundScreen extends StatelessWidget {
  const _TariffNotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: Text('Тариф не найден')),
    );
  }
}

/// Экран ошибки загрузки тарифа
class _TariffErrorScreen extends StatelessWidget {
  final String message;

  const _TariffErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(child: Text(message)),
    );
  }
}

/// Контент страницы деталей тарифа
class TariffDetailsContent extends StatefulWidget {
  final dynamic tariff;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const TariffDetailsContent({
    required this.tariff,
    super.key,
    this.fromAddress,
    this.toAddress,
  });

  @override
  State<TariffDetailsContent> createState() => _TariffDetailsContentState();
}

class _TariffDetailsContentState extends State<TariffDetailsContent> {
  OrderFormData? _formData;
  late final OrdersBloc _ordersBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ordersBloc = getIt<OrdersBloc>();
    _ordersBloc.stream.listen((state) {
      if (state is OrderCreated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Заказ успешно создан!'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (state is OrdersError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка создания заказа: ${state.message}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
  }

  void _onFormDataChanged(OrderFormData data) {
    setState(() {
      _formData = data;
    });
  }

  @override
  void dispose() {
    _ordersBloc.close();
    super.dispose();
  }

  Future<void> _createOrder() async {
    if (_formData == null) return;
    if (_formKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Заполните все обязательные поля'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    try {
      final orderData = OrderData(
        isDefect: _formData!.isDefect,
        isFragile: _formData!.isFragile,
        category: _formData!.category,
        comment: _formData!.comment,
        contentPhotos: _formData!.contentPhotoIds,
        description: _formData!.description,
        fromAddress: widget.fromAddress?.fullAddress ?? '',
        fromApartment: _formData!.fromApartment,
        fromCityId: widget.fromAddress?.cityId != null
            ? int.tryParse(widget.fromAddress!.cityId) ?? 0
            : 0,
        fromEntrance: _formData!.fromEntrance,
        fromFloor: _formData!.fromFloor,
        fromLatitude: 0.0,
        fromLongitude: 0.0,
        height: widget.tariff.height ?? 0.0,
        length: widget.tariff.length ?? 0.0,
        photos: const [],
        tariffId: widget.tariff.id,
        toAddress: widget.toAddress?.fullAddress ?? '',
        toApartment: _formData!.toApartment,
        toCityId: widget.toAddress?.cityId != null
            ? int.tryParse(widget.toAddress!.cityId) ?? 0
            : 0,
        toEntrance: _formData!.toEntrance,
        toFloor: _formData!.toFloor,
        toLatitude: 0.0,
        toLongitude: 0.0,
        toName: _formData!.toName,
        toPhone: _formData!.toPhone,
        volumetricWeight: widget.tariff.volumetricWeight ?? 0.0,
        weight: widget.tariff.weight ?? 0.0,
        width: widget.tariff.width ?? 0.0,
      );
      _ordersBloc.add(CreateOrderEvent(orderData: orderData));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка загрузки фотографий: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _TariffDetailsAppBar(
        tariffName: widget.tariff.name,
        onCreateTariffPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateTariffPage(),
            ),
          );
        },
      ),
      body: _TariffDetailsBody(
        tariff: widget.tariff,
        formKey: _formKey,
        ordersBloc: _ordersBloc,
        formData: _formData,
        onFormDataChanged: _onFormDataChanged,
        onCreateOrder: _createOrder,
      ),
    );
  }
}

/// AppBar для страницы деталей тарифа
class _TariffDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String tariffName;
  final VoidCallback onCreateTariffPressed;

  const _TariffDetailsAppBar({
    required this.tariffName,
    required this.onCreateTariffPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        tariffName,
        style: AppTypography.h5.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: AppColors.textPrimary),
          onPressed: onCreateTariffPressed,
          tooltip: 'Создать тариф',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Тело страницы деталей тарифа
class _TariffDetailsBody extends StatelessWidget {
  final dynamic tariff;
  final GlobalKey<FormState> formKey;
  final OrdersBloc ordersBloc;
  final OrderFormData? formData;
  final Function(OrderFormData) onFormDataChanged;
  final VoidCallback onCreateOrder;

  const _TariffDetailsBody({
    required this.tariff,
    required this.formKey,
    required this.ordersBloc,
    required this.formData,
    required this.onFormDataChanged,
    required this.onCreateOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TariffImageHeader(imageUrl: tariff.image),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TariffTitle(name: tariff.name),
                const SizedBox(height: AppSpacing.sm),
                if (tariff.description.isNotEmpty) ...[
                  _TariffDescription(description: tariff.description),
                  const SizedBox(height: AppSpacing.lg),
                ],
                TariffCharacteristicsCard(
                  weight: tariff.weight,
                  length: tariff.length,
                  width: tariff.width,
                  height: tariff.height,
                  volumetricWeight: tariff.volumetricWeight,
                ),
                const SizedBox(height: AppSpacing.xxl),
                BlocProvider.value(
                  value: ordersBloc,
                  child: OrderCreationForm(
                    formKey: formKey,
                    onDataChanged: onFormDataChanged,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                _CreateOrderButton(
                  ordersBloc: ordersBloc,
                  isEnabled: formData != null,
                  onPressed: onCreateOrder,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Название тарифа
class _TariffTitle extends StatelessWidget {
  final String name;

  const _TariffTitle({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppTypography.h3.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Описание тарифа
class _TariffDescription extends StatelessWidget {
  final String description;

  const _TariffDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }
}

/// Кнопка создания заказа
class _CreateOrderButton extends StatelessWidget {
  final OrdersBloc ordersBloc;
  final bool isEnabled;
  final VoidCallback onPressed;

  const _CreateOrderButton({
    required this.ordersBloc,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: ordersBloc,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              ),
            ),
            child: state is OrdersLoading
                ? const _LoadingIndicator()
                : const _ButtonLabel(),
          ),
        );
      },
    );
  }
}

/// Индикатор загрузки в кнопке
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppSpacing.iconSizeMD,
      width: AppSpacing.iconSizeMD,
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: AppDimensions.progressStrokeWidth,
      ),
    );
  }
}

/// Текст кнопки
class _ButtonLabel extends StatelessWidget {
  const _ButtonLabel();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Создать заказ',
      style: AppTypography.buttonLarge.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
