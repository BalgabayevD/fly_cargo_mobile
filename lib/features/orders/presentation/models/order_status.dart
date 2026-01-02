import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';

enum OrderStatus {
  // Клиентские статусы
  created, // Создано клиентом
  cancelled, // Отменено клиентом
  decided, // Отклонено курьером
  // Статусы курьера
  accepted, // Курьер взехал за посылкой
  submitted, // Курьер подтвердил заказ
  // Статусы склада
  accounted, // Посылка принята на склад оператором
  checked, // Посылка прошла обработку на складе
  revision, // Посылка возвращена на пересмотр или доработку на этапе обработки
  // Статусы доставки
  dispatched, // Посылка отгружается
  transit, // Посылка отправлена
  arrived, // Посылка отправлена (прибыла в город назначения)
  deliversRecipient, // Курьер везет посылку получателю
  // Финальный статус
  completed, // Посылка выполнена
}

extension OrderStatusExtension on OrderStatus {
  String get text {
    switch (this) {
      case OrderStatus.created:
        return 'Создан';
      case OrderStatus.cancelled:
        return 'Отменен';
      case OrderStatus.decided:
        return 'Отклонен курьером';
      case OrderStatus.accepted:
        return 'Ожидаем курьера';
      case OrderStatus.submitted:
        return 'Обработка на складе';
      case OrderStatus.accounted:
        return 'Обработка на складе';
      case OrderStatus.checked:
        return 'Обработка на складе';
      case OrderStatus.revision:
        return 'Обработка на складе';
      case OrderStatus.dispatched:
        return 'Доставка в Астану';
      case OrderStatus.transit:
        return 'Доставка в Астану';
      case OrderStatus.arrived:
        return 'Передано курьеру';
      case OrderStatus.deliversRecipient:
        return 'Передано курьеру';
      case OrderStatus.completed:
        return 'Доставлен';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case OrderStatus.created:
        return AppColors.white;
      case OrderStatus.cancelled:
        return const Color(0xFFFFF5F5); // Светло-красный для отмененных
      case OrderStatus.decided:
        return const Color(0xFFFFF5F5); // Светло-красный для отклоненных
      case OrderStatus.accepted:
        return AppColors.white;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
        return const Color(0xFFFFFBF0); // Светло-желтый для обработки на складе
      case OrderStatus.dispatched:
      case OrderStatus.transit:
        return const Color(0xFFF0F7FF); // Светло-синий для доставки
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return AppColors.white;
      case OrderStatus.completed:
        return const Color(0xFFF0FFF4); // Светло-зеленый для доставлен
    }
  }

  Color get borderColor {
    switch (this) {
      case OrderStatus.created:
      case OrderStatus.accepted:
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return const Color(0xFFE0E0E0); // Серая рамка для обычных
      case OrderStatus.cancelled:
      case OrderStatus.decided:
        return const Color(0xFFFF4444); // Красная рамка
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
      case OrderStatus.dispatched:
      case OrderStatus.transit:
      case OrderStatus.completed:
        return const Color(0xFFE0E0E0); // Серая рамка
    }
  }

  Color get statusTextColor {
    switch (this) {
      case OrderStatus.created:
        return AppColors.surface5;
      case OrderStatus.cancelled:
        return const Color(0xFFFF4444); // Красный
      case OrderStatus.decided:
        return const Color(0xFFFF4444); // Красный
      case OrderStatus.accepted:
        return AppColors.surface5;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
        return const Color(0xFFFFB800); // Желтый/оранжевый
      case OrderStatus.dispatched:
      case OrderStatus.transit:
        return const Color(0xFF0066FF); // Синий
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return AppColors.surface5;
      case OrderStatus.completed:
        return const Color(0xFF00B341); // Зеленый
    }
  }
}

class OrderStatusHelper {
  static OrderStatus getStatus(OrderModel order) {
    if (order.status != null && order.status!.isNotEmpty) {
      switch (order.status!.toLowerCase()) {
        case 'created':
          return OrderStatus.created;
        case 'cancelled':
          return OrderStatus.cancelled;
        case 'decided':
          return OrderStatus.decided;
        case 'accepted':
          return OrderStatus.accepted;
        case 'submitted':
          return OrderStatus.submitted;
        case 'accounted':
          return OrderStatus.accounted;
        case 'checked':
          return OrderStatus.checked;
        case 'revision':
          return OrderStatus.revision;
        case 'dispatched':
          return OrderStatus.dispatched;
        case 'transit':
          return OrderStatus.transit;
        case 'arrived':
          return OrderStatus.arrived;
        case 'delivers_recipient':
          return OrderStatus.deliversRecipient;
        case 'completed':
          return OrderStatus.completed;
        default:
          // По умолчанию для неизвестного статуса
          return OrderStatus.created;
      }
    }

    // Если статус не указан, возвращаем created
    return OrderStatus.created;
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
