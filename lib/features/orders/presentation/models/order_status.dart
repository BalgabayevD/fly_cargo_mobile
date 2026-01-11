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
  static const _processingStatuses = {
    OrderStatus.submitted,
    OrderStatus.accounted,
    OrderStatus.checked,
    OrderStatus.revision,
  };

  static const _transitStatuses = {
    OrderStatus.dispatched,
    OrderStatus.transit,
  };
  static const _courierStatuses = {
    OrderStatus.arrived,
    OrderStatus.deliversRecipient,
  };

  static const _errorStatuses = {
    OrderStatus.cancelled,
    OrderStatus.decided,
  };


  String getLocalizedText(BuildContext context) {
    if (_processingStatuses.contains(this)) {
      return context.l10n.orderStatusProcessing;
    }
    if (_transitStatuses.contains(this)) {
      return context.l10n.orderStatusDeliveryToCity;
    }
    if (_courierStatuses.contains(this)) {
      return context.l10n.orderStatusHandedToCourierShort;
    }

    switch (this) {
      case OrderStatus.created:
        return context.l10n.orderStatusCreated;
      case OrderStatus.cancelled:
        return context.l10n.orderStatusCancelled;
      case OrderStatus.decided:
        return context.l10n.orderStatusDecided;
      case OrderStatus.accepted:
        return context.l10n.orderStatusAccepted;
      case OrderStatus.completed:
        return context.l10n.orderStatusCompleted;
      default:
        return context.l10n.orderStatusCreated;
    }
  }

  Color get backgroundColor {
    if (_errorStatuses.contains(this)) return AppColors.errorLight;
    if (_processingStatuses.contains(this)) return AppColors.warningBackground;
    if (_transitStatuses.contains(this)) return AppColors.infoBackground;
    if (this == OrderStatus.completed) return AppColors.successBackground;
    if (this == OrderStatus.created || this == OrderStatus.accepted) {
      return AppColors.warningBackground;
    }
    return AppColors.white;
  }

  Color get borderColor {
    if (_errorStatuses.contains(this)) return AppColors.errorLight;
    return AppColors.warningLight;
  }

  Color get statusTextColor {
    if (_errorStatuses.contains(this)) return AppColors.errorText;
    if (_processingStatuses.contains(this)) return AppColors.warningText;
    if (_transitStatuses.contains(this)) return AppColors.infoText;
    if (this == OrderStatus.completed) return AppColors.successText;
    // Статусы created и accepted - оранжевый текст для акцента
    if (this == OrderStatus.created || this == OrderStatus.accepted) {
      return AppColors.warningText;
    }
    return AppColors.surface5;
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
      }
    }

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
