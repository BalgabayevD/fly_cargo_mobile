import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

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
  /// Локализованный текст статуса
  String getLocalizedText(BuildContext context) {
    switch (this) {
      case OrderStatus.created:
        return context.l10n.orderStatusCreated;
      case OrderStatus.cancelled:
        return context.l10n.orderStatusCancelled;
      case OrderStatus.decided:
        return context.l10n.orderStatusDecided;
      case OrderStatus.accepted:
        return context.l10n.orderStatusAccepted;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
        return context.l10n.orderStatusProcessing;
      case OrderStatus.dispatched:
      case OrderStatus.transit:
        return context.l10n.orderStatusDeliveryToCity;
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return context.l10n.orderStatusHandedToCourierShort;
      case OrderStatus.completed:
        return context.l10n.orderStatusCompleted;
    }
  }

  /// @deprecated Используйте getLocalizedText(context) для локализации
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
        return AppColors.errorLight;
      case OrderStatus.decided:
        return AppColors.errorLight;
      case OrderStatus.accepted:
        return AppColors.white;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
        return AppColors.warningBackground;
      case OrderStatus.dispatched:
      case OrderStatus.transit:
        return AppColors.infoBackground;
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return AppColors.white;
      case OrderStatus.completed:
        return AppColors.successBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case OrderStatus.created:
      case OrderStatus.accepted:
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return AppColors.borderLight;
      case OrderStatus.cancelled:
      case OrderStatus.decided:
        return AppColors.errorBorder;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
      case OrderStatus.dispatched:
      case OrderStatus.transit:
      case OrderStatus.completed:
        return AppColors.borderLight;
    }
  }

  Color get statusTextColor {
    switch (this) {
      case OrderStatus.created:
        return AppColors.surface5;
      case OrderStatus.cancelled:
        return AppColors.errorText;
      case OrderStatus.decided:
        return AppColors.errorText;
      case OrderStatus.accepted:
        return AppColors.surface5;
      case OrderStatus.submitted:
      case OrderStatus.accounted:
      case OrderStatus.checked:
      case OrderStatus.revision:
        return AppColors.warningText;
      case OrderStatus.dispatched:
      case OrderStatus.transit:
        return AppColors.infoText;
      case OrderStatus.arrived:
      case OrderStatus.deliversRecipient:
        return AppColors.surface5;
      case OrderStatus.completed:
        return AppColors.successText;
    }
  }
}

class OrderStatusHelper {
  static OrderStatus getStatus(OrderEntity order) {
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

  static String? getTrackingNumber(OrderEntity order) {
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
