import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart'
    as destination;
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/usecases/upload_order_photo_usecase.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_event.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_state.dart' as bloc_state;
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_state.dart' as page_state;
import 'package:fly_cargo/features/create_order/presentation/mixins/order_bloc_listener_mixin.dart';
import 'package:fly_cargo/features/create_order/presentation/mixins/order_navigation_mixin.dart';
import 'package:fly_cargo/features/create_order/presentation/mixins/photo_handler_mixin.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/create_order_app_bar.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/home_page_content_v2.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart'
    as tariffs;

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage>
    with PhotoHandlerMixin, OrderNavigationMixin, OrderBlocListenerMixin {
  late final UploadOrderPhotoUseCase _uploadOrderPhotoUseCase;
  late final page_state.CreateOrderState _state;

  @override
  void initState() {
    super.initState();
    _uploadOrderPhotoUseCase = getIt<UploadOrderPhotoUseCase>();
    _state = page_state.CreateOrderState();
  }

  // PhotoHandlerMixin
  @override
  UploadOrderPhotoUseCase get uploadOrderPhotoUseCase =>
      _uploadOrderPhotoUseCase;
  @override
  List<File> get photos => _state.photos;
  @override
  Map<File, String> get photoIds => _state.photoIds;
  @override
  bool get isAnalyzing => _state.isAnalyzing;
  @override
  void addPhoto(File photo) => setState(() => _state.photos.add(photo));
  @override
  void removePhotoFromList(File photo) =>
      setState(() => _state.photos.remove(photo));
  @override
  void removePhotoId(File photo) => _state.photoIds.remove(photo);
  @override
  void setAnalyzing(bool value) => setState(() => _state.isAnalyzing = value);

  // OrderNavigationMixin
  @override
  destination.AddressModel? get fromAddress => _state.fromAddress;
  @override
  destination.AddressModel? get toAddress => _state.toAddress;
  @override
  String? get recipientName => _state.recipientName;
  @override
  String? get recipientPhone => _state.recipientPhone;
  @override
  int? get selectedTariffId => _state.selectedTariffId;
  @override
  String? get description => _state.description;
  @override
  void updateFromAddress(destination.AddressModel? address) =>
      setState(() => _state.fromAddress = address);
  @override
  void updateToAddress(destination.AddressModel? address) =>
      setState(() => _state.toAddress = address);
  @override
  void updateRecipient(String? name, String? phone) {
    setState(() {
      _state.recipientName = name;
      _state.recipientPhone = phone;
    });
  }

  @override
  void updateDescription(String? desc) =>
      setState(() => _state.description = desc);
  @override
  void updateTariff(tariffs.TariffModel tariff) =>
      setState(() => _state.updateTariff(tariff));
  @override
  void updateCustomDimensions(double? length, double? width, double? height) {
    setState(() {
      _state.customLength = length;
      _state.customWidth = width;
      _state.customHeight = height;
    });
  }

  @override
  void recalculatePrice() => recalculatePriceIfPossible();

  // OrderBlocListenerMixin
  @override
  void updatePreOrderData(PreCreateOrderData data, AnalysisStatus status) =>
      setState(() => _state.updatePreOrderData(data, status));
  @override
  void resetOrderForm() => setState(() => _state.reset());
  @override
  void showSuccessMessage(String message) => showSuccess(message);
  @override
  void showErrorMessage(String message) => showError(message);

  void _submitOrder() {
    context.read<CreateOrderBloc>().add(
          SubmitOrderFormEvent(
            fromAddress: _state.fromAddress,
            toAddress: _state.toAddress,
            recipientName: _state.recipientName,
            recipientPhone: _state.recipientPhone,
            selectedTariffId: _state.selectedTariffId,
            selectedTariff: _state.selectedTariff,
            description: _state.description,
            isFragile: _state.isFragile,
            customLength: _state.customLength,
            customWidth: _state.customWidth,
            customHeight: _state.customHeight,
            photos: _state.photos,
            photoIds: _state.photoIds,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrderBloc, bloc_state.CreateOrderState>(
      listener: handleOrdersState,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CreateOrderAppBar(),
        body: HomePageContentV2(
          fromAddress: _state.fromAddress,
          toAddress: _state.toAddress,
          recipientName: _state.recipientName,
          recipientPhone: _state.recipientPhone,
          tariffWeight: _state.tariffWeight,
          description: _state.description,
          photos: _state.photos,
          onFromAddressSelection: openFromAddressSelection,
          onToAddressSelection: openToAddressSelection,
          onRecipientForm: openRecipientForm,
          onDescriptionForm: openDescriptionForm,
          onPickPhoto: pickPhoto,
          onRemovePhoto: removePhoto,
          onWeightTap: openTariffSelection,
          onSubmitOrder: _submitOrder,
          isAnalyzing: _state.isAnalyzing,
          isAnalysisCompleted: _state.preOrderData != null,
          analysisStatus: _state.analysisStatus,
        ),
      ),
    );
  }
}
