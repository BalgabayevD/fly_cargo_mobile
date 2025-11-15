import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';

class TariffSelectionWidget extends StatelessWidget {
  const TariffSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
      builder: (context, state) {
        if (state is TariffSelectionLoaded) {
          final categoriesWithTariffs = state.categories
              .where(
                (category) =>
                    category.tariffs != null && category.tariffs!.isNotEmpty,
              )
              .toList();

          if (categoriesWithTariffs.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Center(
                child: Text(
                  'Нет доступных категорий тарифов',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            );
          }


          final effectiveSelectedCategoryId =
              state.selectedCategoryId ??
              (categoriesWithTariffs.isNotEmpty
                  ? categoriesWithTariffs.first.id
                  : null);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesWithTariffs.length,
                  itemBuilder: (context, index) {
                    final category = categoriesWithTariffs[index];
                    final isSelected =
                        effectiveSelectedCategoryId == category.id;

                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          if (category.id != null) {
                            context.read<TariffSelectionBloc>().add(
                              SelectTariffCategoryEvent(category.id!),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryWithOpacity(0.1)
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.border,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              if (effectiveSelectedCategoryId != null) ...[
                _buildTariffsList(context, state),
              ],
            ],
          );
        }

        if (state is TariffSelectionError) {
          return Center(child: Text(state.message, style: AppTypography.error));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildTariffsList(BuildContext context, TariffSelectionLoaded state) {
    final categoriesWithTariffs = state.categories
        .where(
          (category) =>
              category.tariffs != null && category.tariffs!.isNotEmpty,
        )
        .toList();

    final selectedCategory = categoriesWithTariffs.firstWhere(
      (category) => category.id == state.selectedCategoryId,
      orElse: () => categoriesWithTariffs.first,
    );

    if (selectedCategory.tariffs == null || selectedCategory.tariffs!.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Center(
          child: Text(
            'В данной категории пока нет доступных тарифов',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedCategory.tariffs?.length ?? 0,
        itemBuilder: (context, index) {
          final tariff = selectedCategory.tariffs![index];
          final isSelected = state.selectedTariffId == tariff.id;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TariffOptionWidget(
              tariff: tariff,
              isSelected: isSelected,
              onTap: () => context.read<TariffSelectionBloc>().add(
                SelectTariffEvent(tariff.id),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TariffOptionWidget extends StatelessWidget {
  final TariffModel tariff;
  final bool isSelected;
  final VoidCallback onTap;

  const TariffOptionWidget({
    super.key,
    required this.tariff,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryWithOpacity(0.1)
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: tariff.image.isNotEmpty
                    ? Image.network(
                        tariff.image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.local_shipping,
                            size: 30,
                            color: AppColors.textSecondary,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Icon(
                            Icons.local_shipping,
                            size: 30,
                            color: AppColors.textSecondary,
                          );
                        },
                      )
                    : Icon(
                        Icons.local_shipping,
                        size: 30,
                        color: AppColors.textSecondary,
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tariff.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${tariff.weight ?? 0} кг',
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
