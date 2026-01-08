import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/ai_analysis_indicator.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/analysis_status_message.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/photo_grid_section.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/order_field_card_v2.dart';

class HomePageContentV2 extends StatelessWidget {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final String? recipientName;
  final String? recipientPhone;
  final double? tariffWeight;
  final String? description;
  final List<File> photos;
  final VoidCallback onFromAddressSelection;
  final VoidCallback onToAddressSelection;
  final VoidCallback onRecipientForm;
  final VoidCallback onDescriptionForm;
  final VoidCallback onPickPhoto;
  final Function(File) onRemovePhoto;
  final VoidCallback? onWeightTap;
  final VoidCallback? onSubmitOrder;
  final bool isAnalyzing;
  final bool isAnalysisCompleted;
  final AnalysisStatus? analysisStatus;

  const HomePageContentV2({
    required this.fromAddress,
    required this.toAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.tariffWeight,
    required this.description,
    required this.photos,
    required this.onFromAddressSelection,
    required this.onToAddressSelection,
    required this.onRecipientForm,
    required this.onDescriptionForm,
    required this.onPickPhoto,
    required this.onRemovePhoto,
    this.onWeightTap,
    this.onSubmitOrder,
    this.isAnalyzing = false,
    this.isAnalysisCompleted = false,
    this.analysisStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          PhotoGridSection(
            photos: photos,
            onPickPhoto: onPickPhoto,
            onRemovePhoto: onRemovePhoto,
          ),
          const SizedBox(height: AppSpacing.md),
          if (isAnalyzing)
            AIAnalysisIndicator()
          else if (!isAnalysisCompleted && photos.isEmpty)
            SizedBox.shrink()
          else if (isAnalysisCompleted && analysisStatus != null)
            AnalysisStatusMessage(status: analysisStatus!),
          const SizedBox(height: AppSpacing.lg),
          OrderFieldCardV2(
            label: context.l10n.from,
            value: fromAddress?.displayText,
            onTap: onFromAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: context.l10n.to,
            value: toAddress?.displayText,
            onTap: onToAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: context.l10n.recipient,
            value: recipientName != null && recipientPhone != null
                ? '$recipientName, $recipientPhone'
                : null,
            onTap: onRecipientForm,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: context.l10n.weightInKg,
            value: tariffWeight?.toStringAsFixed(1),
            showChevron: onWeightTap != null,
            onTap: onWeightTap,
            isEnabled: isAnalysisCompleted && !isAnalyzing,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: context.l10n.description,
            value: description,
            onTap: onDescriptionForm,
            isEnabled: isAnalysisCompleted && !isAnalyzing,
          ),
          if (onSubmitOrder != null) ...[
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: onSubmitOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                ),
                child: Text(
                  context.l10n.createOrder,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
