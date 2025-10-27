import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/create_tariff_page.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_details_form.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';

class TariffDetailsPage extends StatelessWidget {
  final int tariffId;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const TariffDetailsPage({
    super.key,
    required this.tariffId,
    this.fromAddress,
    this.toAddress,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
      builder: (context, state) {
        if (state is TariffSelectionLoaded) {
          // Находим выбранный тариф
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
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF333333),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: const Center(child: Text('Тариф не найден')),
            );
          }

          return TariffDetailsContent(
            tariff: selectedTariff,
            fromAddress: fromAddress,
            toAddress: toAddress,
          );
        }

        if (state is TariffSelectionError) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF333333),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Center(child: Text(state.message)),
          );
        }

        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class TariffDetailsContent extends StatefulWidget {
  final dynamic tariff;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const TariffDetailsContent({
    super.key,
    required this.tariff,
    this.fromAddress,
    this.toAddress,
  });

  @override
  State<TariffDetailsContent> createState() => _TariffDetailsContentState();
}

class _TariffDetailsContentState extends State<TariffDetailsContent> {
  OrderFormData? _formData;
  late final OrdersBloc _ordersBloc;

  @override
  void initState() {
    super.initState();
    _ordersBloc = getIt<OrdersBloc>();

    // Слушаем изменения состояния OrdersBloc
    _ordersBloc.stream.listen((state) {
      if (state is OrderCreated) {
        // Показываем сообщение об успехе
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Заказ успешно создан!'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 2),
          ),
        );

        // Закрываем страницу и возвращаемся на главную
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (state is OrdersError) {
        // Показываем сообщение об ошибке
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка создания заказа: ${state.message}'),
            backgroundColor: AppColors.error,
            duration: Duration(seconds: 3),
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
    // Отписываемся от стрима при закрытии страницы
    _ordersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.tariff.name,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF333333)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTariffPage(),
                ),
              );
            },
            tooltip: 'Создать тариф',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение тарифа
            Container(
              width: double.infinity,
              height: 200,
              color: AppColors.gray50,
              child: widget.tariff.image.isNotEmpty
                  ? Image.network(
                      widget.tariff.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.local_shipping,
                            size: 60,
                            color: AppColors.textSecondary,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                  : const Center(
                      child: Icon(
                        Icons.local_shipping,
                        size: 60,
                        color: AppColors.textSecondary,
                      ),
                    ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Название тарифа
                  Text(
                    widget.tariff.name,
                    style: AppTypography.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Описание тарифа
                  if (widget.tariff.description.isNotEmpty) ...[
                    Text(
                      widget.tariff.description,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Характеристики тарифа
                  _buildTariffCharacteristics(),

                  const SizedBox(height: 24),

                  // Форма заказа
                  BlocProvider.value(
                    value: _ordersBloc,
                    child: OrderDetailsForm(onDataChanged: _onFormDataChanged),
                  ),

                  const SizedBox(height: 24),

                  // Кнопка создания заказа
                  BlocBuilder<OrdersBloc, OrdersState>(
                    bloc: _ordersBloc,
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _formData != null
                              ? () => _createOrder(context)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: state is OrdersLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Создать заказ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTariffCharacteristics() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Характеристики',
            style: AppTypography.h5.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _buildCharacteristicRow('Вес', '${widget.tariff.weight ?? 0} кг'),
          if (widget.tariff.length != null && widget.tariff.length! > 0)
            _buildCharacteristicRow('Длина', '${widget.tariff.length} см'),
          if (widget.tariff.width != null && widget.tariff.width! > 0)
            _buildCharacteristicRow('Ширина', '${widget.tariff.width} см'),
          if (widget.tariff.height != null && widget.tariff.height! > 0)
            _buildCharacteristicRow('Высота', '${widget.tariff.height} см'),
          if (widget.tariff.volumetricWeight != null &&
              widget.tariff.volumetricWeight! > 0)
            _buildCharacteristicRow(
              'Объемный вес',
              '${widget.tariff.volumetricWeight} кг',
            ),
        ],
      ),
    );
  }

  Widget _buildCharacteristicRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _createOrder(BuildContext context) {
    if (_formData == null) return;

    // Создаем OrderData из OrderFormData
    final orderData = OrderData(
      isDefect: _formData!.isDefect,
      isFragile: _formData!.isFragile,
      category: _formData!.category,
      comment: _formData!.comment,
      contentPhotos: const [], // TODO: Добавить загрузку фото
      description: _formData!.description,
      fromAddress: widget.fromAddress?.fullAddress ?? '',
      fromApartment: _formData!.fromApartment,
      fromCityId: widget.fromAddress?.cityId != null
          ? int.tryParse(widget.fromAddress!.cityId) ?? 0
          : 0,
      fromEntrance: _formData!.fromEntrance,
      fromFloor: _formData!.fromFloor,
      fromLatitude: 0.0, // TODO: Получить из адреса
      fromLongitude: 0.0, // TODO: Получить из адреса
      height: widget.tariff.height ?? 0.0,
      length: widget.tariff.length ?? 0.0,
      photos: const [], // TODO: Добавить загрузку фото
      tariffId: widget.tariff.id,
      toAddress: widget.toAddress?.fullAddress ?? '',
      toApartment: _formData!.toApartment,
      toCityId: widget.toAddress?.cityId != null
          ? int.tryParse(widget.toAddress!.cityId) ?? 0
          : 0,
      toEntrance: _formData!.toEntrance,
      toFloor: _formData!.toFloor,
      toLatitude: 0.0, // TODO: Получить из адреса
      toLongitude: 0.0, // TODO: Получить из адреса
      volumetricWeight: widget.tariff.volumetricWeight ?? 0.0,
      weight: widget.tariff.weight ?? 0.0,
      width: widget.tariff.width ?? 0.0,
    );

    _ordersBloc.add(CreateOrderEvent(orderData: orderData));
  }
}
