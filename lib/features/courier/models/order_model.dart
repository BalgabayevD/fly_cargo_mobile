import 'package:flutter/material.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';

enum OrderStatus {
  pending, // Ожидает курьера
  assigned, // Назначен курьеру
  pickedUp, // Забран у отправителя
  inTransit, // В пути
  delivered, // Доставлен
  cancelled, // Отменен
}

enum OrderPriority {
  low, // Низкий
  medium, // Средний
  high, // Высокий
  urgent, // Срочный
}

class CourierOrder {
  final String id;
  final String orderNumber;
  final OrderStatus status;
  final OrderPriority priority;
  final DateTime createdAt;
  final DateTime? estimatedDeliveryTime;
  final AddressModel pickupAddress;
  final AddressModel deliveryAddress;
  final String recipientName;
  final String recipientPhone;
  final String? cargoDescription;
  final String boxType;
  final String boxName;
  final String boxDimensions;
  final double estimatedPrice;
  final String currency;
  final List<String>? photos;
  final String? notes;
  final String? courierId;
  final String? courierName;

  const CourierOrder({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.priority,
    required this.createdAt,
    this.estimatedDeliveryTime,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.recipientName,
    required this.recipientPhone,
    this.cargoDescription,
    required this.boxType,
    required this.boxName,
    required this.boxDimensions,
    required this.estimatedPrice,
    required this.currency,
    this.photos,
    this.notes,
    this.courierId,
    this.courierName,
  });

  CourierOrder copyWith({
    String? id,
    String? orderNumber,
    OrderStatus? status,
    OrderPriority? priority,
    DateTime? createdAt,
    DateTime? estimatedDeliveryTime,
    AddressModel? pickupAddress,
    AddressModel? deliveryAddress,
    String? recipientName,
    String? recipientPhone,
    String? cargoDescription,
    String? boxType,
    String? boxName,
    String? boxDimensions,
    double? estimatedPrice,
    String? currency,
    List<String>? photos,
    String? notes,
    String? courierId,
    String? courierName,
  }) {
    return CourierOrder(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      estimatedDeliveryTime:
          estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      cargoDescription: cargoDescription ?? this.cargoDescription,
      boxType: boxType ?? this.boxType,
      boxName: boxName ?? this.boxName,
      boxDimensions: boxDimensions ?? this.boxDimensions,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      currency: currency ?? this.currency,
      photos: photos ?? this.photos,
      notes: notes ?? this.notes,
      courierId: courierId ?? this.courierId,
      courierName: courierName ?? this.courierName,
    );
  }

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'Ожидает курьера';
      case OrderStatus.assigned:
        return 'Назначен курьеру';
      case OrderStatus.pickedUp:
        return 'Забран у отправителя';
      case OrderStatus.inTransit:
        return 'В пути';
      case OrderStatus.delivered:
        return 'Доставлен';
      case OrderStatus.cancelled:
        return 'Отменен';
    }
  }

  String get priorityText {
    switch (priority) {
      case OrderPriority.low:
        return 'Низкий';
      case OrderPriority.medium:
        return 'Средний';
      case OrderPriority.high:
        return 'Высокий';
      case OrderPriority.urgent:
        return 'Срочный';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return const Color(0xFFFF9500);
      case OrderStatus.assigned:
        return const Color(0xFF007AFF);
      case OrderStatus.pickedUp:
        return const Color(0xFF5856D6);
      case OrderStatus.inTransit:
        return const Color(0xFF32D74B);
      case OrderStatus.delivered:
        return const Color(0xFF34C759);
      case OrderStatus.cancelled:
        return const Color(0xFFFF3B30);
    }
  }

  Color get priorityColor {
    switch (priority) {
      case OrderPriority.low:
        return const Color(0xFF34C759);
      case OrderPriority.medium:
        return const Color(0xFFFF9500);
      case OrderPriority.high:
        return const Color(0xFFFF3B30);
      case OrderPriority.urgent:
        return const Color(0xFF8E44AD);
    }
  }
}
