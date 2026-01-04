import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/specify_dimensions_bottom_sheet.dart';
import 'package:fly_cargo/features/tariff/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';
import 'package:heroicons/heroicons.dart';

class ChooseTariffBottomSheet extends StatefulWidget {
  final TariffEntity? initialTariff;

  const ChooseTariffBottomSheet({
    this.initialTariff,
    super.key,
  });

  @override
  State<ChooseTariffBottomSheet> createState() =>
      _ChooseTariffBottomSheetState();
}

class _ChooseTariffBottomSheetState extends State<ChooseTariffBottomSheet> {
  TariffEntity? _selectedTariff;

  @override
  void initState() {
    super.initState();
    _selectedTariff = widget.initialTariff;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TariffSelectionBloc>().add(LoadTariffCategoriesEvent());
    });
  }

  void _onTariffSelected(TariffEntity tariff) {
    setState(() {
      _selectedTariff = tariff;
    });
  }

  void _onCustomSizesTap() {
    showModalBottomSheet<Map<String, double>>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SpecifyDimensionsBottomSheet(),
    ).then((result) {
      if (result != null && mounted) {
        Navigator.pop(context, {
          'customDimensions': result,
        });
      }
    });
  }

  void _onConfirm() {
    if (_selectedTariff != null) {
      Navigator.pop(context, _selectedTariff);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
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
                Expanded(
                  child: Text(
                    'Тариф',
                    style: AppTypography.h5,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: HeroIcon(
                    HeroIcons.xMark,
                    size: 24,
                    color: AppColors.surface4,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Flexible(
            child: BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
              builder: (context, state) {
                if (state is TariffSelectionLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }
                if (state is TariffSelectionError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Text(
                        state.message,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.danger,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                if (state is TariffSelectionLoaded) {
                  final allTariffs = <TariffEntity>[];
                  for (final category in state.categories) {
                    if (category.tariffs != null) {
                      allTariffs.addAll(category.tariffs!);
                    }
                  }
                  return _TariffsList(
                    tariffs: allTariffs,
                    selectedTariff: _selectedTariff,
                    onTariffSelected: _onTariffSelected,
                    onCustomSizesTap: _onCustomSizesTap,
                  );
                }
                return const SizedBox.shrink();
              },
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
                onPressed: _selectedTariff != null ? _onConfirm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.surface3,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.lg,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                ),
                child: Text(
                  'Выбрать',
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

class _TariffsList extends StatelessWidget {
  final List<TariffEntity> tariffs;
  final TariffEntity? selectedTariff;
  final Function(TariffEntity) onTariffSelected;
  final VoidCallback onCustomSizesTap;

  const _TariffsList({
    required this.tariffs,
    required this.selectedTariff,
    required this.onTariffSelected,
    required this.onCustomSizesTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          ...tariffs.map(
            (tariff) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: _TariffItem(
                tariff: tariff,
                isSelected: selectedTariff?.id == tariff.id,
                onTap: () => onTariffSelected(tariff),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _CustomSizesButton(onTap: onCustomSizesTap),
        ],
      ),
    );
  }
}

class _TariffItem extends StatelessWidget {
  final TariffEntity tariff;
  final bool isSelected;
  final VoidCallback onTap;

  const _TariffItem({
    required this.tariff,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tariff.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.primary : Colors.black,
              ),
            ),
            if (tariff.description.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                tariff.description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CustomSizesButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CustomSizesButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.straighten, color: AppColors.primary),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Указать нестандартные размеры',
              style: const TextStyle(fontSize: 15, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
