import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_creation_form.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';

import 'widgets/box_info_card.dart';
import 'widgets/create_order_button.dart';

// Простая модель для информации о типе посылки
class BoxInfo {
  final String id;
  final String name;
  final String dimensions;
  final String imagePath;
  final double height;
  final double length;
  final double width;
  final double weight;
  final int tariffId;

  const BoxInfo({
    required this.id,
    required this.name,
    required this.dimensions,
    required this.imagePath,
    required this.height,
    required this.length,
    required this.width,
    required this.weight,
    required this.tariffId,
  });

  double get volumetricWeight => length * width * height / 5000;
}

class CreateOrderPage extends StatelessWidget {
  final String boxType;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const CreateOrderPage({
    required this.boxType,
    super.key,
    this.fromAddress,
    this.toAddress,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Загрузка данных о коробке с сервера
    final box = _getBoxByType(boxType);

    if (box == null) {
      return _ErrorScreen();
    }

    return CreateOrderContent(
      box: box,
      fromAddress: fromAddress,
      toAddress: toAddress,
    );
  }

  BoxInfo? _getBoxByType(String type) {
    // TODO: Заменить на реальные данные с сервера
    // Временная заглушка - возвращаем базовую информацию
    switch (type) {
      case 'small':
        return const BoxInfo(
          id: 'small',
          name: 'Маленькая коробка',
          dimensions: '15 × 10 × 20 см',
          imagePath: 'assets/images/small.png',
          height: 20.0,
          length: 15.0,
          width: 10.0,
          weight: 0.5,
          tariffId: 1,
        );
      case 'medium':
        return const BoxInfo(
          id: 'medium',
          name: 'Средняя коробка',
          dimensions: '20 × 20 × 30 см',
          imagePath: 'assets/images/medium.png',
          height: 30.0,
          length: 20.0,
          width: 20.0,
          weight: 1.0,
          tariffId: 2,
        );
      case 'big':
        return const BoxInfo(
          id: 'big',
          name: 'Большая коробка',
          dimensions: '30 × 30 × 40 см',
          imagePath: 'assets/images/big.png',
          height: 40.0,
          length: 30.0,
          width: 30.0,
          weight: 2.0,
          tariffId: 3,
        );
      default:
        return null;
    }
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

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
      body: const Center(
        child: Text('Ошибка загрузки информации о коробке'),
      ),
    );
  }
}

class CreateOrderContent extends StatefulWidget {
  final BoxInfo box;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const CreateOrderContent({
    required this.box,
    super.key,
    this.fromAddress,
    this.toAddress,
  });

  @override
  State<CreateOrderContent> createState() => _CreateOrderContentState();
}

class _CreateOrderContentState extends State<CreateOrderContent> {
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

  void _createOrder() {
    if (!_validateOrderData()) {
      return;
    }

    final orderData = _buildOrderData();
    _ordersBloc.add(CreateOrderEvent(orderData: orderData));
  }

  bool _validateOrderData() {
    if (widget.fromAddress == null || widget.toAddress == null) {
      _showErrorSnackBar('Сначала укажите адреса отправки и доставки');
      return false;
    }

    if (_formData == null) {
      _showErrorSnackBar('Заполните все обязательные поля');
      return false;
    }

    if (_formKey.currentState?.validate() != true) {
      _showErrorSnackBar('Заполните все обязательные поля');
      return false;
    }

    return true;
  }

  OrderData _buildOrderData() {
    return OrderData(
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
      height: widget.box.height,
      length: widget.box.length,
      photos: [],
      tariffId: widget.box.tariffId,
      toAddress: widget.toAddress!.address,
      toApartment: _formData!.toApartment,
      toCityId: int.parse(widget.toAddress!.cityId),
      toEntrance: _formData!.toEntrance,
      toFloor: _formData!.toFloor,
      toLatitude: 0.0,
      toLongitude: 0.0,
      toName: _formData!.toName,
      toPhone: _formData!.toPhone,
      volumetricWeight: widget.box.volumetricWeight,
      weight: widget.box.weight,
      width: widget.box.width,
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _showSuccessSnackBar(int orderId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Заказ #$orderId создан успешно!'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      bloc: _ordersBloc,
      listener: (context, state) {
        if (state is OrderCreated) {
          _showSuccessSnackBar(state.orderResult.orderId);
          Navigator.pop(context, true);
        } else if (state is OrdersUnauthorized) {
          _showErrorSnackBar('Для создания заказа необходимо войти в аккаунт');
        } else if (state is OrdersError) {
          _showErrorSnackBar('Ошибка создания заказа: ${state.message}');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: _CreateOrderAppBar(boxName: widget.box.name),
        body: _CreateOrderBody(
          box: widget.box,
          formKey: _formKey,
          ordersBloc: _ordersBloc,
          onFormDataChanged: _onFormDataChanged,
          onCreateOrder: _createOrder,
        ),
      ),
    );
  }
}

class _CreateOrderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String boxName;

  const _CreateOrderAppBar({required this.boxName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
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
        boxName,
        style: AppTypography.h5.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(AppSpacing.dividerHeight),
        child: Container(
          height: AppSpacing.dividerHeight,
          color: AppColors.borderLight,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppSpacing.dividerHeight);
}

class _CreateOrderBody extends StatelessWidget {
  final BoxInfo box;
  final GlobalKey<FormState> formKey;
  final OrdersBloc ordersBloc;
  final Function(OrderFormData) onFormDataChanged;
  final VoidCallback onCreateOrder;

  const _CreateOrderBody({
    required this.box,
    required this.formKey,
    required this.ordersBloc,
    required this.onFormDataChanged,
    required this.onCreateOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxInfoCard(box: box),
          const SizedBox(height: AppSpacing.xxl),
          OrderCreationForm(
            formKey: formKey,
            onDataChanged: onFormDataChanged,
          ),
          const SizedBox(height: AppSpacing.xxl),
          CreateOrderButton(
            ordersBloc: ordersBloc,
            onPressed: onCreateOrder,
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
