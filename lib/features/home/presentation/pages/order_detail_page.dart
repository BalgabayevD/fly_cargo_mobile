import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderModel order;
  final UserType userType;
  const OrderDetailPage({
    required this.order,
    required this.userType,
    super.key,
  });

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('d MMMM yyyy', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }

  String _getStatusText(String? status) {
    switch (status) {
      case 'submitted':
        return 'Посылка готова к отправке';
      case 'awaiting_payment':
        return 'Ожидает оплаты';
      case 'paid':
        return 'Оплачено';
      case 'in_transit':
        return 'В пути';
      case 'delivered':
        return 'Доставлено';
      default:
        return 'Создан';
    }
  }

  int _getStatusStep(String? status) {
    switch (status) {
      case 'submitted':
        return 1;
      case 'awaiting_payment':
        return 1;
      case 'paid':
        return 2;
      case 'in_transit':
        return 3;
      case 'delivered':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusStep = _getStatusStep(order.status);
    final price = order.priceCalculations?.sellingPrice ?? order.price ?? 0;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<OrdersBloc>().add(const GetClientOrdersEvent());
          },
        ),
        title: Text(
          'Заказ ${order.id}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              // TODO: Implement share
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Статус
            Text(
              _getStatusText(order.status),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Курьер приедит за посылкой после оплаты',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Прогресс
            _buildProgressBar(statusStep),
            const SizedBox(height: AppSpacing.xxl),

            // Кнопки оплаты и отмены
            if (!order.isPaid) ...[
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement payment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97D4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                    ),
                  ),
                  child: Text(
                    userType.isUser
                        ? 'Оплатить ${price.toStringAsFixed(0)} тг'
                        : 'Привязать штрихкод',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement cancel
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFAE5E5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                    ),
                  ),
                  child: const Text(
                    'Отменить',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE74C3C),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],

            // Дата отправления
            _buildInfoSection(
              'Отправлен',
              _formatDate(order.createdAt),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Откуда
            _buildInfoSection(
              'Откуда',
              '${order.fromCity?.name ?? ''}, ${order.fromAddress}',
            ),
            const SizedBox(height: AppSpacing.xl),

            // Куда
            _buildInfoSection(
              'Куда',
              '${order.toCity?.name ?? ''}, ${order.toAddress}',
            ),
            const SizedBox(height: AppSpacing.xl),

            // Получатель
            _buildInfoSection(
              'Получатель',
              '${order.toName ?? ''}, ${order.toPhone ?? ''}',
            ),
            const SizedBox(height: AppSpacing.xl),

            // Тариф
            if (order.tariff != null) ...[
              _buildInfoSection(
                'Тариф',
                order.tariff!.name,
              ),
              const SizedBox(height: AppSpacing.xl),
            ],

            // Комментарий
            if (order.comment.isNotEmpty) ...[
              _buildInfoSection(
                'Комментарий',
                order.comment,
              ),
              const SizedBox(height: AppSpacing.xl),
            ],

            // Описание
            if (order.description.isNotEmpty) ...[
              _buildInfoSection(
                'Описание',
                order.description,
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(int currentStep) {
    return Row(
      children: [
        _buildStepCircle(Icons.check, currentStep >= 1),
        _buildStepLine(currentStep >= 2),
        _buildStepCircle(Icons.local_shipping_outlined, currentStep >= 2),
        _buildStepLine(currentStep >= 3),
        _buildStepCircle(Icons.play_arrow_outlined, currentStep >= 3),
        _buildStepLine(currentStep >= 4),
        _buildStepCircle(Icons.flag_outlined, currentStep >= 4),
      ],
    );
  }

  Widget _buildStepCircle(IconData icon, bool isActive) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFFD97D4E) : const Color(0xFFFFE5D9),
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : const Color(0xFFD97D4E),
        size: 28,
      ),
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? const Color(0xFFD97D4E) : const Color(0xFFFFE5D9),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
