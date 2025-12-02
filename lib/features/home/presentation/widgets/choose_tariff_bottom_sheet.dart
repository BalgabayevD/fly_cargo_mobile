import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/widgets/specify_dimensions_bottom_sheet.dart';
import 'package:fly_cargo/features/home/presentation/widgets/tariff_item_widget.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:heroicons/heroicons.dart';

class ChooseTariffBottomSheet extends StatefulWidget {
  final TariffModel? initialTariff;

  const ChooseTariffBottomSheet({
    this.initialTariff,
    super.key,
  });

  @override
  State<ChooseTariffBottomSheet> createState() =>
      _ChooseTariffBottomSheetState();
}

class _ChooseTariffBottomSheetState extends State<ChooseTariffBottomSheet> {
  TariffModel? _selectedTariff;

  @override
  void initState() {
    super.initState();
    _selectedTariff = widget.initialTariff;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TariffSelectionBloc>().add(LoadTariffCategoriesEvent());
    });
  }

  void _onTariffSelected(TariffModel tariff) {
    setState(() {
      _selectedTariff = tariff;
    });
  }

  void _onCustomSizesTap() {
    showModalBottomSheet<Map<String, double>>(
      context: context,
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
            padding: const EdgeInsets.all(AppSpacing.lg),
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
                  icon: const HeroIcon(
                    HeroIcons.xMark,
                    size: 24,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
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
                          color: AppColors.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                if (state is TariffSelectionLoaded) {
                  final allTariffs = <TariffModel>[];
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
                  disabledBackgroundColor: AppColors.disabled,
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
  final List<TariffModel> tariffs;
  final TariffModel? selectedTariff;
  final Function(TariffModel) onTariffSelected;
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
              child: TariffItem(
                tariff: tariff,
                isSelected: selectedTariff?.id == tariff.id,
                onTap: () => onTariffSelected(tariff),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          CustomSizesButton(onTap: onCustomSizesTap),
        ],
      ),
    );
  }
}
