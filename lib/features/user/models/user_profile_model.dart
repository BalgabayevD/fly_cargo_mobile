import 'package:flutter/material.dart';

class UserProfile {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final DateTime joinDate;
  final String status; // active, inactive, suspended
  final List<PaymentCard> paymentCards;
  final List<Order> orderHistory;
  final NotificationSettings notificationSettings;

  const UserProfile({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.avatarUrl,
    required this.joinDate,
    required this.status,
    required this.paymentCards,
    required this.orderHistory,
    required this.notificationSettings,
  });

  String get statusText {
    switch (status) {
      case 'active':
        return 'Активен';
      case 'inactive':
        return 'Неактивен';
      case 'suspended':
        return 'Приостановлен';
      default:
        return 'Неизвестно';
    }
  }

  Color get statusColor {
    switch (status) {
      case 'active':
        return const Color(0xFF34C759);
      case 'inactive':
        return const Color(0xFFFF9500);
      case 'suspended':
        return const Color(0xFFFF3B30);
      default:
        return const Color(0xFF666666);
    }
  }

  PaymentCard? get primaryCard {
    return paymentCards.isNotEmpty ? paymentCards.first : null;
  }
}

class PaymentCard {
  final String id;
  final String type; // visa, mastercard, etc.
  final String lastFourDigits;
  final String holderName;
  final bool isPrimary;
  final DateTime expiryDate;

  const PaymentCard({
    required this.id,
    required this.type,
    required this.lastFourDigits,
    required this.holderName,
    required this.isPrimary,
    required this.expiryDate,
  });

  String get displayName {
    return '$type -$lastFourDigits';
  }

  IconData get icon {
    switch (type.toLowerCase()) {
      case 'visa':
        return Icons.credit_card;
      case 'mastercard':
        return Icons.credit_card;
      default:
        return Icons.credit_card;
    }
  }
}

class Order {
  final String id;
  final String fromAddress;
  final String toAddress;
  final DateTime createdAt;
  final OrderStatus status;
  final double cost;
  final String? description;

  const Order({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.createdAt,
    required this.status,
    required this.cost,
    this.description,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'В ожидании';
      case OrderStatus.inProgress:
        return 'В процессе';
      case OrderStatus.completed:
        return 'Завершен';
      case OrderStatus.cancelled:
        return 'Отменен';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return const Color(0xFFFF9500);
      case OrderStatus.inProgress:
        return const Color(0xFF007AFF);
      case OrderStatus.completed:
        return const Color(0xFF34C759);
      case OrderStatus.cancelled:
        return const Color(0xFFFF3B30);
    }
  }
}

enum OrderStatus { pending, inProgress, completed, cancelled }

class NotificationSettings {
  final bool orderUpdates;
  final bool promotions;
  final bool paymentNotifications;
  final bool systemNotifications;

  const NotificationSettings({
    required this.orderUpdates,
    required this.promotions,
    required this.paymentNotifications,
    required this.systemNotifications,
  });

  NotificationSettings copyWith({
    bool? orderUpdates,
    bool? promotions,
    bool? paymentNotifications,
    bool? systemNotifications,
  }) {
    return NotificationSettings(
      orderUpdates: orderUpdates ?? this.orderUpdates,
      promotions: promotions ?? this.promotions,
      paymentNotifications: paymentNotifications ?? this.paymentNotifications,
      systemNotifications: systemNotifications ?? this.systemNotifications,
    );
  }
}
