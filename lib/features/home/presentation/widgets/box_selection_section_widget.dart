import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/widgets/select_box_button.dart';
import 'package:fly_cargo/features/home/presentation/widgets/tariff_selection_widget.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart';
mixin BoxSelectionSectionStyling {
  static const double spacing = 16.0;
  static const double buttonSpacing = 20.0;
  static const double padding = 16.0;
  static const double borderRadius = 12.0;
  static const double borderWidth = 1.0;
  static const double iconSize = 18.0;
  static const double containerSize = 32.0;
  static const double iconContainerBorderRadius = 8.0;
  static const double textSpacing = 12.0;
}
class BoxSelectionSectionWidget extends StatelessWidget
    with BoxSelectionSectionStyling {
  final void Function(BuildContext, String) onBoxDetailsTap;
  const BoxSelectionSectionWidget({required this.onBoxDetailsTap, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBoxSelectionHeader(),
        const SizedBox(height: BoxSelectionSectionStyling.spacing),
        const TariffSelectionWidget(),
        const SizedBox(height: 12),
        const _CompactPriceWidget(),
        BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
          builder: (context, state) {
            if (state is TariffSelectionLoaded &&
                state.selectedTariffId != null) {
              return Column(
                children: [
                  const SizedBox(
                    height: BoxSelectionSectionStyling.buttonSpacing,
                  ),
                  SelectBoxButton(
                    onTap: () => onBoxDetailsTap(
                      context,
                      state.selectedTariffId.toString(),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
  Widget _buildBoxSelectionHeader() {
    return Container(
      padding: const EdgeInsets.all(BoxSelectionSectionStyling.padding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          BoxSelectionSectionStyling.borderRadius,
        ),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: BoxSelectionSectionStyling.borderWidth,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: BoxSelectionSectionStyling.containerSize,
            height: BoxSelectionSectionStyling.containerSize,
            decoration: const BoxDecoration(
              color: Color(0xFFFF9500),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  BoxSelectionSectionStyling.iconContainerBorderRadius,
                ),
              ),
            ),
            child: const Icon(
              Icons.inventory_2,
              color: Colors.white,
              size: BoxSelectionSectionStyling.iconSize,
            ),
          ),
          const SizedBox(width: BoxSelectionSectionStyling.textSpacing),
          const Expanded(
            child: Text(
              'Выберите коробку для упаковки',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Компактный виджет для отображения цены на главной странице
class _CompactPriceWidget extends StatelessWidget {
  const _CompactPriceWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCalculationBloc, PriceCalculationState>(
      builder: (context, state) {
        if (state is PriceCalculationLoading) {
          return _buildLoadingCard();
        }

        if (state is PriceCalculationLoaded) {
          return _buildPriceCard(state.priceCalculation);
        }

        if (state is PriceCalculationError) {
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Расчет стоимости...',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceCard(priceCalculation) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Стоимость доставки',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    priceCalculation.sellingPrice?.toStringAsFixed(0) ?? '—',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      '₸',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Рассчитано',
              style: AppTypography.caption.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
