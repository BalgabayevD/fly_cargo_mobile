import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';

enum OrderStatus {
  awaitingPayment,
  free, // Свободный (оранжевый)
  accepted, // Принять (оранжевый с белым фоном)
  toWarehouse, // Увезти на склад (персиковый)
  rejected, // Отклонил (розовый)
  completed, // Выполнен (зеленый)
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
      case OrderStatus.free:
        return 'Свободный';
      case OrderStatus.accepted:
        return 'Принять';
      case OrderStatus.toWarehouse:
        return 'Увезти на склад';
      case OrderStatus.rejected:
        return 'Отклонил';
      case OrderStatus.completed:
        return 'Выполнен';
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
      case OrderStatus.free:
        return AppColors.white;
      case OrderStatus.accepted:
        return AppColors.white;
      case OrderStatus.toWarehouse:
        return const Color(0xFFFAE5E5); // Персиковый
      case OrderStatus.rejected:
        return const Color(0xFFFCE4EC); // Розовый
      case OrderStatus.completed:
        return const Color(0xFFE8F5E9); // Зеленый
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
      case OrderStatus.free:
        return const Color(0xFFD97D4E); // Оранжевый
      case OrderStatus.accepted:
        return const Color(0xFFD97D4E); // Оранжевый
      case OrderStatus.toWarehouse:
        return null;
      case OrderStatus.rejected:
        return null;
      case OrderStatus.completed:
        return null;
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
      case OrderStatus.free:
        return const Color(0xFFD97D4E); // Оранжевый
      case OrderStatus.accepted:
        return const Color(0xFFD97D4E); // Оранжевый
      case OrderStatus.toWarehouse:
        return const Color(0xFFE74C3C); // Красный
      case OrderStatus.rejected:
        return const Color(0xFFE74C3C); // Красный
      case OrderStatus.completed:
        return const Color(0xFF4CAF50); // Зеленый
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
        case 'created':
        case 'free':
          return OrderStatus.free;
        case 'accepted':
        case 'принять':
          return OrderStatus.accepted;
        case 'to_warehouse':
        case 'увезти на склад':
          return OrderStatus.toWarehouse;
        case 'rejected':
        case 'отклонил':
          return OrderStatus.rejected;
        case 'completed':
        case 'выполнен':
          return OrderStatus.completed;
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
