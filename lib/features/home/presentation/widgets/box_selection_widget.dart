import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/features/home/presentation/bloc/box_selection_bloc.dart';

class BoxSelectionWidget extends StatelessWidget {
  const BoxSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxSelectionBloc, BoxSelectionState>(
      builder: (context, state) {
        if (state is BoxSelectionLoaded) {
          return Row(
            children: state.boxes.map((box) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: BoxOptionWidget(
                    box: box,
                    isSelected: state.selectedBoxType == box.id,
                    onTap: () => context.read<BoxSelectionBloc>().add(
                      SelectBoxEvent(box.id),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }

        if (state is BoxSelectionError) {
          return Center(child: Text(state.message, style: AppTypography.error));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class BoxOptionWidget extends StatelessWidget {
  final BoxEntity box;
  final bool isSelected;
  final VoidCallback onTap;

  const BoxOptionWidget({
    super.key,
    required this.box,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  box.imagePath,
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getShortName(box.name),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              box.dimensions,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getShortName(String fullName) {
    if (fullName.contains('Маленькая')) return 'Маленькая';
    if (fullName.contains('Средняя')) return 'Средняя';
    if (fullName.contains('Большая')) return 'Большая';
    return fullName;
  }
}
