import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/order_field_card_v2.dart';
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
            _AIAnalysisIndicator()
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

class _AIAnalysisIndicator extends StatefulWidget {
  const _AIAnalysisIndicator();

  @override
  State<_AIAnalysisIndicator> createState() => _AIAnalysisIndicatorState();
}

class _AIAnalysisIndicatorState extends State<_AIAnalysisIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Row(
          children: [
            // AI иконка с пульсацией слева
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final scale = 1.0 + (0.1 * (_controller.value * 4 % 1));
                return Transform.scale(
                  scale: scale,
                  child: Icon(
                    Icons.auto_awesome,
                    size: 24,
                    color: AppColors.primary,
                  ),
                );
              },
            ),
            const SizedBox(width: AppSpacing.md),
            // Деления прогресс бара справа
            Expanded(
              child: Row(
                children: List.generate(20, (index) {
                  final isActive = _progressAnimation.value >= (index + 1) / 20;
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 2,
                        right: index == 19 ? 0 : 2,
                      ),
                      height: 4,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.surface2,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
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
