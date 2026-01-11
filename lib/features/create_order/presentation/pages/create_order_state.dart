import 'dart:io';

import 'package:fly_cargo/features/destination/data/models/destination_models.dart'
    as destination;
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart'
    as tariffs;

class CreateOrderState {
  destination.AddressModel? fromAddress;
  destination.AddressModel? toAddress;
  String? recipientName;
  String? recipientPhone;
  int? selectedTariffId;
  String? tariffName;
  double? tariffWeight;
  tariffs.TariffModel? selectedTariff;
  String? description;
  bool isFragile;
  double? customLength;
  double? customWidth;
  double? customHeight;
  final List<File> photos;
  final Map<File, String> photoIds;
  PreCreateOrderData? preOrderData;
  AnalysisStatus? analysisStatus;
  bool isAnalyzing;

  CreateOrderState({
    this.fromAddress,
    this.toAddress,
    this.recipientName,
    this.recipientPhone,
    this.selectedTariffId,
    this.tariffName,
    this.tariffWeight,
    this.selectedTariff,
    this.description,
    this.isFragile = false,
    this.customLength,
    this.customWidth,
    this.customHeight,
    List<File>? photos,
    Map<File, String>? photoIds,
    this.preOrderData,
    this.analysisStatus,
    this.isAnalyzing = false,
  })  : photos = photos ?? [],
        photoIds = photoIds ?? {};

  void reset() {
    fromAddress = null;
    toAddress = null;
    recipientName = null;
    recipientPhone = null;
    selectedTariffId = null;
    tariffName = null;
    tariffWeight = null;
    selectedTariff = null;
    description = null;
    isFragile = false;
    photos.clear();
    photoIds.clear();
    customLength = null;
    customWidth = null;
    customHeight = null;
    preOrderData = null;
    analysisStatus = null;
    isAnalyzing = false;
  }

  void updatePreOrderData(PreCreateOrderData data, AnalysisStatus status) {
    isAnalyzing = false;
    preOrderData = data;
    analysisStatus = status;
    description = data.description;
    selectedTariffId = data.tariffId;
    customLength = data.length.toDouble();
    customWidth = data.width.toDouble();
    customHeight = data.height.toDouble();
    tariffWeight = data.weight;
  }

  void updateTariff(tariffs.TariffModel tariff) {
    selectedTariff = tariff;
    selectedTariffId = tariff.id;
    tariffName = tariff.name;
    tariffWeight = tariff.weight;
    customLength = null;
    customWidth = null;
    customHeight = null;
  }
}

