import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart'
    as tariffs;

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
  @override
  List<Object?> get props => [];
}

class CreateOrderEvent extends OrdersEvent {
  final OrderData orderData;
  const CreateOrderEvent({required this.orderData});
  @override
  List<Object?> get props => [orderData];
}

class SubmitOrderEvent extends OrdersEvent {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final String? recipientName;
  final String? recipientPhone;
  final int? selectedTariffId;
  final tariffs.TariffModel? selectedTariff;
  final String? description;
  final bool isFragile;
  final double? customLength;
  final double? customWidth;
  final double? customHeight;
  final List<File> photos;
  final Map<File, String> photoIds;

  const SubmitOrderEvent({
    required this.fromAddress,
    required this.toAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.selectedTariffId,
    required this.selectedTariff,
    required this.description,
    required this.isFragile,
    required this.customLength,
    required this.customWidth,
    required this.customHeight,
    required this.photos,
    required this.photoIds,
  });

  @override
  List<Object?> get props => [
        fromAddress,
        toAddress,
        recipientName,
        recipientPhone,
        selectedTariffId,
        selectedTariff,
        description,
        isFragile,
        customLength,
        customWidth,
        customHeight,
        photos,
        photoIds,
      ];
}

class PreCreateOrderEvent extends OrdersEvent {
  final List<File> images;
  const PreCreateOrderEvent({required this.images});
  @override
  List<Object?> get props => [images];
}

class ResetOrdersEvent extends OrdersEvent {
  const ResetOrdersEvent();
}

class GetClientOrdersEvent extends OrdersEvent {
  const GetClientOrdersEvent();
}

class GetCourierOrdersEvent extends OrdersEvent {
  const GetCourierOrdersEvent();
}

class GetCreatedOrdersEvent extends OrdersEvent {
  const GetCreatedOrdersEvent();
}

class GetOrderByIdEvent extends OrdersEvent {
  final String orderId;
  const GetOrderByIdEvent({required this.orderId});
  @override
  List<Object?> get props => [orderId];
}
