import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_details_form.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';

class BoxDetailsPage extends StatelessWidget {
  final String boxType;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const BoxDetailsPage({
    super.key,
    required this.boxType,
    this.fromAddress,
    this.toAddress,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceLocator().getBoxByTypeUseCase(boxType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
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
            body: const Center(
              child: Text('Ошибка загрузки информации о коробке'),
            ),
          );
        }

        final box = snapshot.data!;
        return BoxDetailsContent(
          box: box,
          fromAddress: fromAddress,
          toAddress: toAddress,
        );
      },
    );
  }
}

class BoxDetailsContent extends StatefulWidget {
  final dynamic box;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const BoxDetailsContent({
    super.key,
    required this.box,
    this.fromAddress,
    this.toAddress,
  });

  @override
  State<BoxDetailsContent> createState() => _BoxDetailsContentState();
}

class _BoxDetailsContentState extends State<BoxDetailsContent> {
  OrderFormData? _formData;
  late final OrdersBloc _ordersBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ordersBloc = getIt<OrdersBloc>();
  }

  void _onFormDataChanged(OrderFormData data) {
    setState(() {
      _formData = data;
    });
  }


  double _getBoxHeight(BoxEntity box) {
    switch (box.id) {
      case 'small':
        return 20.0;
      case 'medium':
        return 30.0;
      case 'big':
        return 40.0;
      default:
        return 30.0;
    }
  }

  double _getBoxLength(BoxEntity box) {
    switch (box.id) {
      case 'small':
        return 15.0;
      case 'medium':
        return 20.0;
      case 'big':
        return 30.0;
      default:
        return 20.0;
    }
  }

  double _getBoxWidth(BoxEntity box) {
    switch (box.id) {
      case 'small':
        return 10.0;
      case 'medium':
        return 20.0;
      case 'big':
        return 30.0;
      default:
        return 20.0;
    }
  }

  double _getBoxWeight(BoxEntity box) {
    switch (box.id) {
      case 'small':
        return 0.5;
      case 'medium':
        return 1.0;
      case 'big':
        return 2.0;
      default:
        return 1.0;
    }
  }

  double _getBoxVolumetricWeight(BoxEntity box) {
    return _getBoxLength(box) *
        _getBoxWidth(box) *
        _getBoxHeight(box) /
        5000;
  }

  int _getBoxTariffId(BoxEntity box) {
    switch (box.id) {
      case 'small':
        return 1;
      case 'medium':
        return 2;
      case 'big':
        return 3;
      default:
        return 2;
    }
  }

  void _createOrder() {
    if (widget.fromAddress == null || widget.toAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала укажите адреса отправки и доставки'),
          backgroundColor: Color(0xFFFF3B30),
        ),
      );
      return;
    }

    if (_formData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Заполните все обязательные поля'),
          backgroundColor: Color(0xFFFF3B30),
        ),
      );
      return;
    }


    if (_formKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Заполните все обязательные поля'),
          backgroundColor: Color(0xFFFF3B30),
        ),
      );
      return;
    }

    final orderData = OrderData(
      isDefect: _formData!.isDefect,
      isFragile: _formData!.isFragile,
      category: _formData!.category,
      comment: _formData!.comment,
      contentPhotos: _formData!.contentPhotoIds,
      description: _formData!.description,
      fromAddress: widget.fromAddress!.address,
      fromApartment: _formData!.fromApartment,
      fromCityId: int.parse(widget.fromAddress!.cityId),
      fromEntrance: _formData!.fromEntrance,
      fromFloor: _formData!.fromFloor,
      fromLatitude: 0.0,
      fromLongitude: 0.0,
      height: _getBoxHeight(widget.box),
      length: _getBoxLength(widget.box),
      photos: [],
      tariffId: _getBoxTariffId(widget.box),
      toAddress: widget.toAddress!.address,
      toApartment: _formData!.toApartment,
      toCityId: int.parse(widget.toAddress!.cityId),
      toEntrance: _formData!.toEntrance,
      toFloor: _formData!.toFloor,
      toLatitude: 0.0,
      toLongitude: 0.0,
      toName: _formData!.toName,
      toPhone: _formData!.toPhone,
      volumetricWeight: _getBoxVolumetricWeight(widget.box),
      weight: _getBoxWeight(widget.box),
      width: _getBoxWidth(widget.box),
    );

    _ordersBloc.add(CreateOrderEvent(orderData: orderData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      bloc: _ordersBloc,
      listener: (context, state) {
        if (state is OrderCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Заказ #${state.orderResult.orderId} создан успешно!',
              ),
              backgroundColor: AppColors.success,
            ),
          );
          Navigator.pop(context, true);
        } else if (state is OrdersError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка создания заказа: ${state.message}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.box.name,
            style: AppTypography.h5.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: AppColors.borderLight),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [

                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.box.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),


                      Text(
                        widget.box.name,
                        style: AppTypography.h4.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),


                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Размеры: ${widget.box.dimensions}',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),


              AppCardWithTitle(
                title: 'Описание',
                variant: AppCardVariant.filled,
                child: Text(
                  widget.box.description,
                  style: AppTypography.bodyMedium.copyWith(
                    height: AppTypography.lineHeightRelaxed,
                  ),
                ),
              ),
              const SizedBox(height: 30),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.1),
                      AppColors.primary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Стоимость доставки',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'от ${widget.box.basePrice.toInt()} ${widget.box.currency}',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),


              OrderDetailsForm(
                formKey: _formKey,
                onDataChanged: _onFormDataChanged,
              ),
              const SizedBox(height: 24),


              BlocBuilder<OrdersBloc, OrdersState>(
                bloc: _ordersBloc,
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: state is OrdersLoading
                          ? null
                          : LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.primaryDark,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: state is OrdersLoading
                          ? null
                          : [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                    ),
                    child: ElevatedButton(
                      onPressed: state is OrdersLoading ? null : _createOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: state is OrdersLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Создать заказ',
                                  style: AppTypography.buttonLarge.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
