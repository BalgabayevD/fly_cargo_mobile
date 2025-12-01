import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';

/// Статусы заказа
enum OrderStatus {
  awaitingPayment, // Ожидает оплаты
  inWarehouse, // На складе
  delivered, // Доставлен
}

/// Расширение для получения текста статуса
extension OrderStatusExtension on OrderStatus {
  String get text {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return 'Ожидает оплаты';
      case OrderStatus.inWarehouse:
        return 'На складе в Алмате';
      case OrderStatus.delivered:
        return 'Доставлен';
    }
  }

  /// Цвет фона карточки
  Color get backgroundColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return AppColors.white;
      case OrderStatus.inWarehouse:
        return const Color(0xFFFFF4E6); // Светло-персиковый/оранжевый
      case OrderStatus.delivered:
        return const Color(0xFFE8F5E9); // Светло-зеленый
    }
  }

  /// Цвет границы карточки
  Color? get borderColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return const Color(0xFFFF9800); // Оранжевая граница
      case OrderStatus.inWarehouse:
        return null; // Без границы
      case OrderStatus.delivered:
        return null; // Без границы
    }
  }

  /// Цвет текста статуса
  Color get statusTextColor {
    switch (this) {
      case OrderStatus.awaitingPayment:
        return const Color(0xFFFF9800); // Оранжевый
      case OrderStatus.inWarehouse:
        return const Color(0xFFFF5722); // Оранжево-красный
      case OrderStatus.delivered:
        return const Color(0xFF4CAF50); // Зеленый
    }
  }
}

/// Helper для определения статуса заказа
class OrderStatusHelper {
  /// Определить статус заказа на основе его полей
  static OrderStatus getStatus(OrderModel order) {
    // Если не оплачен - ожидает оплаты
    if (!order.isPaid) {
      return OrderStatus.awaitingPayment;
    }

    // Если есть QR коды - на складе
    if (order.qrs != null && order.qrs!.isNotEmpty) {
      return OrderStatus.inWarehouse;
    }

    // Если удален (доставлен) - доставлен
    if (order.deletedAt != null) {
      return OrderStatus.delivered;
    }

    // По умолчанию - на складе (если оплачен)
    return OrderStatus.inWarehouse;
  }

  /// Получить трековый номер из QR кодов
  static String? getTrackingNumber(OrderModel order) {
    if (order.qrs != null && order.qrs!.isNotEmpty) {
      // Берем первый QR код, возможно там есть uuid или другой идентификатор
      final qr = order.qrs!.first;
      if (qr.uuid != null && qr.uuid!.isNotEmpty) {
        // Форматируем UUID как трековый номер (например, 123-456-789)
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


