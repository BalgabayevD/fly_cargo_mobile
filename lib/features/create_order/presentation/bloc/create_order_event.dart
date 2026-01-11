import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fly_cargo/features/create_order/data/models/order_data.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart'
    as tariffs;

abstract class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();
  @override
  List<Object?> get props => [];
}

class CreateOrderSubmitEvent extends CreateOrderEvent {
  final OrderData orderData;
  const CreateOrderSubmitEvent({required this.orderData});
  @override
  List<Object?> get props => [orderData];
}

class SubmitOrderFormEvent extends CreateOrderEvent {
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

  const SubmitOrderFormEvent({
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

class PreCreateOrderEvent extends CreateOrderEvent {
  final List<File> images;
  const PreCreateOrderEvent({required this.images});
  @override
  List<Object?> get props => [images];
}

class ResetCreateOrderEvent extends CreateOrderEvent {
  const ResetCreateOrderEvent();
}

