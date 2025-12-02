import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';

enum OrderStatus {
  awaitingPayment,
  submitted,
  inWarehouse,
  inTransit,
  delivered,
  cancelled,
}

extension OrderStatusExtension on OrderStatus {
  String get text {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return 'Ожидает оплаты';
      case OrderStatus.submitted:
        return 'На складе в Алмате';
      case OrderStatus.inWarehouse:
        return 'На складе в Алмате';
      case OrderStatus.inTransit:
        return 'В пути';
      case OrderStatus.delivered:
        return 'Доставлен';
      case OrderStatus.cancelled:
        return 'Отменен';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return AppColors.white;
      case OrderStatus.submitted:
        return const Color(0xFFFFF4E6);
      case OrderStatus.inWarehouse:
        return const Color(0xFFFFE4E8);
      case OrderStatus.inTransit:
        return const Color(0xFFE3F2FD);
      case OrderStatus.delivered:
        return const Color(0xFFF1F8E9);
      case OrderStatus.cancelled:
        return const Color(0xFFF5F5F5);
    }
  }

  Color? get borderColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return AppColors.primary;
      case OrderStatus.submitted:
        return null;
      case OrderStatus.inWarehouse:
        return null;
      case OrderStatus.inTransit:
        return null;
      case OrderStatus.delivered:
        return null;
      case OrderStatus.cancelled:
        return null;
    }
  }

  Color get statusTextColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return AppColors.primary;
      case OrderStatus.submitted:
        return const Color(0xFFFF6F00);
      case OrderStatus.inWarehouse:
        return const Color(0xFFD32F2F);
      case OrderStatus.inTransit:
        return const Color(0xFF1976D2);
      case OrderStatus.delivered:
        return const Color(0xFF7CB342);
      case OrderStatus.cancelled:
        return const Color(0xFF757575);
    }
  }
}

class OrderStatusHelper {
  static OrderStatus getStatus(OrderModel order) {
    if (order.status != null && order.status!.isNotEmpty) {
      switch (order.status!.toLowerCase()) {
        case 'submitted':
          return OrderStatus.submitted;
        case 'in_warehouse':
          return OrderStatus.inWarehouse;
        case 'in_transit':
          return OrderStatus.inTransit;
        case 'delivered':
          return OrderStatus.delivered;
        case 'cancelled':
          return OrderStatus.cancelled;
        default:
          break;
      }
    }

    if (!order.isPaid) {
      return OrderStatus.awaitingPayment;
    }

    if (order.qrs != null && order.qrs!.isNotEmpty) {
      return OrderStatus.inWarehouse;
    }

    if (order.deletedAt != null) {
      return OrderStatus.delivered;
    }

    return OrderStatus.submitted;
  }

  static String? getTrackingNumber(OrderModel order) {
    if (order.qrs != null && order.qrs!.isNotEmpty) {
      final qr = order.qrs!.first;
      if (qr.uuid != null && qr.uuid!.isNotEmpty) {
        final uuid = qr.uuid!;
        if (uuid.length >= 9) {
          return '${uuid.substring(0, 3)}-${uuid.substring(3, 6)}-${uuid.substring(6, 9)}';
        }
        return uuid;
      }
    }
    return null;
  }
}
