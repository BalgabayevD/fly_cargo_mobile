import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/features/tariffs/presentation/bloc/tariffs_event.dart';
import 'package:fly_cargo/features/tariffs/presentation/bloc/tariffs_state.dart';
class TariffCategoryDropdown extends StatefulWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onCategoryChanged;
  const TariffCategoryDropdown({
    required this.onCategoryChanged, super.key,
    this.selectedCategory,
  });
  @override
  State<TariffCategoryDropdown> createState() => _TariffCategoryDropdownState();
}
class _TariffCategoryDropdownState extends State<TariffCategoryDropdown> {
  @override
  void initState() {
    super.initState();
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
            style: AppTypography.bodyMedium.copyWith(color: AppColors.danger),
          );
        }
        if (state is TariffsLoaded) {
          final categories = state.categories
              .where((category) => category.active)
              .map(
                (category) => DropdownMenuItem<String>(
                  value: category.id?.toString() ?? category.key,
                  child: Text(category.name),
                ),
              )
              .toSet()
              .toList();
          final validValues = categories.map((item) => item.value).toSet();
          final selectedValue =
              widget.selectedCategory != null &&
                  validValues.contains(widget.selectedCategory)
              ? widget.selectedCategory
              : null;
          return DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              labelText: 'Выберите категорию',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.surface2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.surface2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              filled: true,
              fillColor: AppColors.surface2,
            ),
            items: categories,
            onChanged: widget.onCategoryChanged,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
