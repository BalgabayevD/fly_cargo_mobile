import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/cancel_order_button.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/copy_payment_link_button.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/order_description_section.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/order_info_section.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/order_payment_button.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_detail/order_timeline.dart';
import 'package:fly_cargo/features/payments/presentation/payment_bottom_sheet.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';

class ClientOrderDetailPage extends StatelessWidget {
  final OrderEntity order;
  final UserType userType;

  const ClientOrderDetailPage({
    required this.order,
    required this.userType,
    super.key,
  });

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('d MMMM', 'ru');
      return formatter.format(date.toLocal());
    } catch (e) {
      return dateString;
    }
  }

  String _getDeliveryDate(BuildContext context) {
    try {
      final date = DateTime.parse(order.createdAt).add(const Duration(days: 3));
      final formatter = DateFormat('d MMMM', 'ru');
      return context.l10n.deliveryOn(formatter.format(date));
    } catch (e) {
      return context.l10n.delivery;
    }
  }

  List<TimelineStep> _buildTimelineSteps(BuildContext context) {
    return [
      TimelineStep(
        title: context.l10n.parcelSent,
        date: _formatDate(order.createdAt),
        isCompleted: true,
      ),
      TimelineStep(
        title: context.l10n.processedAtWarehouse,
        date: _formatDate(order.createdAt),
        isCompleted: false,
      ),
      TimelineStep(
        title: context.l10n.deliveryToCity(order.toCity?.name ?? 'г. Астана'),
        date: _formatDate(
          DateTime.parse(
            order.createdAt,
          ).add(Duration(days: 1)).toIso8601String(),
        ),
        isCompleted: false,
      ),
      TimelineStep(
        title: context.l10n.handedToCourier,
        date: _formatDate(
          DateTime.parse(
            order.createdAt,
          ).add(Duration(days: 1)).toIso8601String(),
        ),
        isCompleted: false,
      ),
    ];
  }

  Future<void> _handlePayment(BuildContext context, double price) async {
    final result = await showPaymentBottomSheet(
      context,
      orderId: order.id,
      price: price,
    );

    if (result == true && context.mounted) {
      // Оплата прошла успешно, можно обновить UI или перейти к списку заказов
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.paymentSuccessful),
          backgroundColor: const Color(0xFF4CAF50),
        ),
      );
      // Можно добавить навигацию или обновление заказа
      Navigator.of(context).pop(); // Возврат к списку заказов
    }
  }

  @override
  Widget build(BuildContext context) {
    final price = order.priceCalculations?.sellingPrice ?? order.price ?? 0;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.surface5, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.l10n.orderDetail(order.id.toString()),
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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _getDeliveryDate(context),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.surface5,
                ),
              ),
            ),
            SizedBox(height: 24),
            OrderTimeline(steps: _buildTimelineSteps(context)),
            SizedBox(height: 24),
            if (!(order.isPaid ?? false)) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: OrderPaymentButton(
                  price: price,
                  userType: userType,
                  onPressed: () => _handlePayment(context, price),
                ),
              ),
              SizedBox(height: 32),
            ],
            OrderInfoSection(
              label: context.l10n.recipientLabel,
              value: '${order.toName ?? ''}, ${order.toPhone ?? ''}',
            ),
            SizedBox(height: 24),
            OrderInfoSection(
              label: context.l10n.deliveryLabel,
              value: '${order.toCity?.name ?? ''}, ${order.toAddress}',
            ),
            SizedBox(height: 24),
            if (order.description.isNotEmpty) ...[
              OrderDescriptionSection(
                description: order.description,
                photos: order.contentPhotos,
              ),
              SizedBox(height: 24),
            ],
            if (order.isPaid != null && !order.isPaid!) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CopyPaymentLinkButton(orderId: order.id),
              ),
              SizedBox(height: 16),
            ],
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CancelOrderButton(onPressed: () {}),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
