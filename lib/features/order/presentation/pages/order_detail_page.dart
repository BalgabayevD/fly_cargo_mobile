import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/features/orders/data/models/order_model.dart';
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
          icon: Icon(Icons.arrow_back, color: AppColors.surface),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Заказ ${order.id}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: AppColors.surface5,
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Курьер приедит за посылкой после оплаты',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.surface4,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Прогресс
            _buildProgressBar(statusStep),
            const SizedBox(height: AppSpacing.xxl),

            // Кнопки оплаты и отмены
            if (!order.isPaid) ...[
              AppButton(
                text: userType.isUser
                    ? 'Оплатить ${price.toStringAsFixed(0)} тг'
                    : 'Привязать штрихкод',
                onPressed: () {
                  // TODO: Implement payment
                },
                size: AppButtonSize.large,
                variant: AppButtonVariant.primary,
                isFullWidth: true,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                text: 'Отменить',
                onPressed: () {
                  // TODO: Implement cancel
                },
                size: AppButtonSize.large,
                variant: AppButtonVariant.danger,
                isFullWidth: true,
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
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.2),
      ),
      child: Icon(
        icon,
        color: isActive ? AppColors.white : AppColors.primary,
        size: 28,
      ),
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.2),
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
            color: AppColors.surface4,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
      ],
    );
  }
}
