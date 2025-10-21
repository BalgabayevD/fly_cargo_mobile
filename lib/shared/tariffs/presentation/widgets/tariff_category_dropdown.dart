import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_event.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_state.dart';

class TariffCategoryDropdown extends StatefulWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onCategoryChanged;

  const TariffCategoryDropdown({
    super.key,
    this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  State<TariffCategoryDropdown> createState() => _TariffCategoryDropdownState();
}

class _TariffCategoryDropdownState extends State<TariffCategoryDropdown> {
  @override
  void initState() {
    super.initState();
    // Загружаем категории при инициализации
    context.read<TariffsBloc>().add(const LoadTariffCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffsBloc, TariffsState>(
      builder: (context, state) {
        if (state is TariffsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TariffsError) {
          return Text(
            'Ошибка загрузки категорий: ${state.message}',
            style: AppTypography.bodyMedium.copyWith(color: AppColors.error),
          );
        }

        if (state is TariffsLoaded) {
          return DropdownButtonFormField<String>(
            value: widget.selectedCategory,
            decoration: InputDecoration(
              labelText: 'Выберите категорию',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.borderLight),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              filled: true,
              fillColor: AppColors.surfaceVariant,
            ),
            items: state.categories
                .where((category) => category.active)
                .map(
                  (category) => DropdownMenuItem<String>(
                    value: category.key,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: widget.onCategoryChanged,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
