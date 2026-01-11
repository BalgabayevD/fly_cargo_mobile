import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/colors.dart';
import 'package:fly_cargo/core/design_system/spacing.dart';

class CourierOrdersTabsWidget extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabChanged;

  const CourierOrdersTabsWidget({
    required this.selectedTabIndex,
    required this.onTabChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(0),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedTabIndex == 0
                        ? const Color(0xFFD97D4E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMD - 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Новые',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedTabIndex == 0
                          ? AppColors.white
                          : AppColors.surface4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(1),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedTabIndex == 1
                        ? const Color(0xFFD97D4E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMD - 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Мои',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedTabIndex == 1
                          ? AppColors.white
                          : AppColors.surface4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

