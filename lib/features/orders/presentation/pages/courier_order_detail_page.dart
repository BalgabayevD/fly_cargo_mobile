import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/orders/presentation/models/order_status.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/courier_action_button.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/courier_info_row.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CourierOrderDetailPage extends StatelessWidget {
  final OrderEntity order;

  const CourierOrderDetailPage({
    required this.order,
    super.key,
  });

  String _formatDateTime(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('d MMMM yyyy, HH:mm', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final uri = Uri.parse('tel:$cleanPhone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  String _getTariffDescription() {
    if (order.tariff != null) {
      return '${order.tariff!.name}, ${order.width.toStringAsFixed(0)}см x ${order.length.toStringAsFixed(0)} см';
    }
    return 'Коробка, ${order.width.toStringAsFixed(0)}см x ${order.length.toStringAsFixed(0)} см';
  }

  @override
  Widget build(BuildContext context) {
    final status = OrderStatusHelper.getStatus(order);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Светло-серый фон
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.surface5, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Заказ ${order.id}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.surface5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: AppColors.surface5),
            onPressed: () {
              // TODO: Реализовать шаринг
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Статус и дата создания
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          status.getLocalizedText(context),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: status.statusTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDateTime(order.createdAt),
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.surface4,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Откуда
                  CourierInfoRow(
                    label: 'Откуда',
                    value:
                        '${order.fromCity?.name ?? ''}, ${order.fromAddress}',
                    onTap: () {
                      // TODO: Открыть карту
                    },
                  ),

                  const Divider(height: 1, thickness: 1),

                  // Куда
                  CourierInfoRow(
                    label: 'Куда',
                    value: '${order.toCity?.name ?? ''}, ${order.toAddress}',
                    onTap: () {
                      // TODO: Открыть карту
                    },
                  ),

                  const Divider(height: 1, thickness: 1),

                  // Получатель
                  CourierInfoRow(
                    label: 'Получатель',
                    value: '${order.toName ?? ''}, ${order.toPhone ?? ''}',
                    onTap: order.toPhone != null
                        ? () => _makePhoneCall(order.toPhone!)
                        : null,
                  ),

                  const SizedBox(height: 8),

                  // Тариф
                  CourierInfoRow(
                    label: 'Тариф',
                    value: _getTariffDescription(),
                    onTap: () {
                      // TODO: Открыть детали тарифа
                    },
                  ),

                  const Divider(height: 1, thickness: 1),

                  // Вес
                  CourierInfoRow(
                    label: 'Вес',
                    value: '${order.weight} кг',
                    showArrow: false,
                  ),

                  const SizedBox(height: 8),

                  // Описание
                  if (order.description.isNotEmpty) ...[
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Описание',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.surface4,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            order.description,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.surface5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],

                  // Примерная дата доставки (если есть)
                  if (order.sendTime != null) ...[
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Примерная дата доставки',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.surface4,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            order.sendTime!,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.surface5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 100), // Отступ для кнопок
                ],
              ),
            ),
          ),

          // Кнопки действий внизу
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Основная кнопка действия (зависит от статуса)
                if (status == OrderStatus.created ||
                    status == OrderStatus.accepted)
                  CourierActionButton(
                    text: status == OrderStatus.created
                        ? 'Еду за посылкой'
                        : 'Принять заказ',
                    onPressed: () {
                      // TODO: Обработать принятие заказа
                    },
                  ),

                if (status == OrderStatus.submitted ||
                    status == OrderStatus.accounted ||
                    status == OrderStatus.checked)
                  CourierActionButton(
                    text: 'Принять заказ',
                    onPressed: () {
                      // TODO: Обработать принятие заказа
                    },
                  ),

                if (status == OrderStatus.arrived ||
                    status == OrderStatus.deliversRecipient)
                  CourierActionButton(
                    text: 'Открыть в 2Gis',
                    onPressed: () {
                      // TODO: Открыть в 2GIS
                    },
                  ),

                // Кнопка отклонения
                if (status == OrderStatus.created ||
                    status == OrderStatus.accepted ||
                    status == OrderStatus.submitted ||
                    status == OrderStatus.accounted ||
                    status == OrderStatus.checked) ...[
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      // TODO: Показать диалог отклонения
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFFF4444),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Отклонить',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 8),

                // Кнопка "Назад"
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.surface5,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text(
                    'Назад',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
