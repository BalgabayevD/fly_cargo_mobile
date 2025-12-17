import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/client/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/client/create_order/presentation/widgets/order_field_card_v2.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

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
    this.isAnalyzing = false,
    this.isAnalysisCompleted = false,
    this.analysisStatus,
    super.key,
  });

  Widget _buildAnalysisStatusMessage(AnalysisStatus status) {
    switch (status) {
      case AnalysisStatus.none:
        // Достаточно фото - показываем успех
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 20,
              color: AppColors.success,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Анализ завершен',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.success,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      case AnalysisStatus.morePhotoInside:
        // Нужно больше фото содержимого
        return Text(
          'Сфотографируйте содержимое посылки',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.danger,
            fontWeight: FontWeight.w400,
          ),
        );
      case AnalysisStatus.morePhotoOutside:
        // Нужно больше фото снаружи
        return Text(
          'Сфотографируйте посылку снаружи',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.danger,
            fontWeight: FontWeight.w400,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          // Фото посылки
          Row(
            children: [
              Expanded(
                child: _PhotoSquareCard(
                  photo: photos.isNotEmpty ? photos[0] : null,
                  onTap: onPickPhoto,
                  onRemove: photos.isNotEmpty
                      ? () => onRemovePhoto(photos[0])
                      : null,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _PhotoSquareCard(
                  photo: photos.length > 1 ? photos[1] : null,
                  onTap: onPickPhoto,
                  onRemove: photos.length > 1
                      ? () => onRemovePhoto(photos[1])
                      : null,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _PhotoSquareCard(
                  photo: photos.length > 2 ? photos[2] : null,
                  onTap: onPickPhoto,
                  onRemove: photos.length > 2
                      ? () => onRemovePhoto(photos[2])
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (isAnalyzing)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Анализируем фото...',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.surface4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          else if (!isAnalysisCompleted && photos.isEmpty)
            Text(
              'Сфотографируйте содержимое посылки',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.danger,
                fontWeight: FontWeight.w400,
              ),
            )
          else if (isAnalysisCompleted && analysisStatus != null)
            _buildAnalysisStatusMessage(analysisStatus!),
          const SizedBox(height: AppSpacing.lg),
          OrderFieldCardV2(
            label: 'Откуда',
            value: fromAddress?.displayText,
            onTap: onFromAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: 'Куда',
            value: toAddress?.displayText,
            onTap: onToAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: 'Получатель',
            value: recipientName != null && recipientPhone != null
                ? '$recipientName, $recipientPhone'
                : null,
            onTap: onRecipientForm,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: 'Вес, в кг',
            value: tariffWeight?.toStringAsFixed(1),
            showChevron: onWeightTap != null,
            onTap: onWeightTap,
            isEnabled: isAnalysisCompleted && !isAnalyzing,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCardV2(
            label: 'Описание',
            value: description,
            onTap: onDescriptionForm,
            isEnabled: isAnalysisCompleted && !isAnalyzing,
          ),
        ],
      ),
    );
  }
}

class _PhotoSquareCard extends StatelessWidget {
  final File? photo;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _PhotoSquareCard({
    required this.onTap,
    this.photo,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: photo == null ? onTap : null,
      child: AspectRatio(
        aspectRatio: 12 / 16,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            border: Border.all(
              color: AppColors.surface2,
              width: 1,
            ),
          ),
          child: photo != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                      child: Image.file(
                        photo!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (onRemove != null)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: onRemove,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.danger.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 32,
                      color: AppColors.surface4,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Добавить\nфото',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.surface4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
