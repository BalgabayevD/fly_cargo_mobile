import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:heroicons/heroicons.dart';

class SpecifyDimensionsBottomSheet extends StatefulWidget {
  final double? initialLength;
  final double? initialWidth;
  final double? initialHeight;

  const SpecifyDimensionsBottomSheet({
    this.initialLength,
    this.initialWidth,
    this.initialHeight,
    super.key,
  });

  @override
  State<SpecifyDimensionsBottomSheet> createState() =>
      _SpecifyDimensionsBottomSheetState();
}

class _SpecifyDimensionsBottomSheetState
    extends State<SpecifyDimensionsBottomSheet> {
  late final TextEditingController _lengthController;
  late final TextEditingController _widthController;
  late final TextEditingController _heightController;

  @override
  void initState() {
    super.initState();
    _lengthController = TextEditingController(
      text: widget.initialLength?.toString() ?? '',
    );
    _widthController = TextEditingController(
      text: widget.initialWidth?.toString() ?? '',
    );
    _heightController = TextEditingController(
      text: widget.initialHeight?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _onSave() {
    final length = double.tryParse(_lengthController.text.trim());
    final width = double.tryParse(_widthController.text.trim());
    final height = double.tryParse(_heightController.text.trim());

    if (length == null || length <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Укажите корректную длину'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (width == null || width <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Укажите корректную ширину'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (height == null || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Укажите корректную высоту'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    Navigator.pop(context, {
      'length': length,
      'width': width,
      'height': height,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Row(
              children: [
                IconButton(
                  icon: const HeroIcon(
                    HeroIcons.chevronLeft,
                    size: 24,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Text(
                    'Укажите размеры',
                    style: AppTypography.h5,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  _DimensionField(
                    label: 'Длина, в см',
                    controller: _lengthController,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _DimensionField(
                    label: 'Ширина',
                    controller: _widthController,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _DimensionField(
                    label: 'Высота, в см',
                    controller: _heightController,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              top: AppSpacing.lg,
              bottom: 56,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.lg,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                ),
                child: Text(
                  'Сохранить',
                  style: AppTypography.buttonLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DimensionField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _DimensionField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: controller.text.isEmpty ? '0' : null,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: AppSpacing.borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: AppSpacing.borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: AppSpacing.borderWidthThick,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          style: AppTypography.bodyLarge,
        ),
      ],
    );
  }
}
