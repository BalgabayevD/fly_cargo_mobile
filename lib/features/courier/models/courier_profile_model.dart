import 'package:flutter/material.dart';
class CourierProfile {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final DateTime joinDate;
  final double rating;
  final int totalDeliveries;
  final int completedDeliveries;
  final double totalEarnings;
  final String status;
  final String? vehicleType;
  final String? licenseNumber;
  final List<String> workingAreas;
  const CourierProfile({
    required this.id,
    required this.name,
    required this.phone,
    required this.joinDate, required this.rating, required this.totalDeliveries, required this.completedDeliveries, required this.totalEarnings, required this.status, required this.workingAreas, this.email,
    this.avatarUrl,
    this.vehicleType,
    this.licenseNumber,
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
  double get completionRate {
    if (totalDeliveries == 0) return 0.0;
    return (completedDeliveries / totalDeliveries) * 100;
  }
}
class CourierIncome {
  final double todayEarnings;
  final double weekEarnings;
  final double monthEarnings;
  final double totalEarnings;
  final int todayDeliveries;
  final int weekDeliveries;
  final int monthDeliveries;
  final List<IncomeTransaction> transactions;
  const CourierIncome({
    required this.todayEarnings,
    required this.weekEarnings,
    required this.monthEarnings,
    required this.totalEarnings,
    required this.todayDeliveries,
    required this.weekDeliveries,
    required this.monthDeliveries,
    required this.transactions,
  });
}
class IncomeTransaction {
  final String id;
  final double amount;
  final String description;
  final DateTime date;
  final String type;
  final String? orderId;
  const IncomeTransaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.type,
    this.orderId,
  });
  String get typeText {
    switch (type) {
      case 'delivery':
        return 'Доставка';
      case 'bonus':
        return 'Бонус';
      case 'penalty':
        return 'Штраф';
      default:
        return 'Другое';
    }
  }
  Color get typeColor {
    switch (type) {
      case 'delivery':
        return const Color(0xFF34C759);
      case 'bonus':
        return const Color(0xFF007AFF);
      case 'penalty':
        return const Color(0xFFFF3B30);
      default:
        return const Color(0xFF666666);
    }
  }
}
class CourierNotification {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;
  final String type;
  const CourierNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    required this.type,
  });
  String get typeText {
    switch (type) {
      case 'order':
        return 'Заказ';
      case 'system':
        return 'Система';
      case 'payment':
        return 'Платеж';
      default:
        return 'Другое';
    }
  }
  Color get typeColor {
    switch (type) {
      case 'order':
        return const Color(0xFF007AFF);
      case 'system':
        return const Color(0xFFFF9500);
      case 'payment':
        return const Color(0xFF34C759);
      default:
        return const Color(0xFF666666);
    }
  }
}
