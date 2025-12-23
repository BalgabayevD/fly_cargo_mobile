import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_option_tile.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/order_section_header.dart';

class OrderOptionsSection extends StatelessWidget {
  final bool isDefect;
  final bool isFragile;
  final ValueChanged<bool> onDefectChanged;
  final ValueChanged<bool> onFragileChanged;
  const OrderOptionsSection({
    required this.isDefect,
    required this.isFragile,
    required this.onDefectChanged,
    required this.onFragileChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderSectionHeader(
          icon: Icons.settings,
          title: 'Дополнительные опции',
          subtitle: '',
        ),
        const SizedBox(height: 16),
        _buildOptionsContainer(),
      ],
    );
  }

  Widget _buildOptionsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surface2),
        boxShadow: [
          BoxShadow(
            color: AppColors.surface5.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          OrderOptionTile(
            icon: Icons.warning_amber_rounded,
            iconColor: AppColors.warning,
            title: 'Хрупкий груз',
            subtitle: 'Требует особой осторожности при транспортировке',
            value: isFragile,
            onChanged: onFragileChanged,
          ),
          Divider(height: 1, color: AppColors.surface2),
          OrderOptionTile(
            icon: Icons.build_circle_outlined,
            iconColor: AppColors.danger,
            title: 'Поврежденный груз',
            subtitle: 'Имеет видимые повреждения или дефекты',
            value: isDefect,
            onChanged: onDefectChanged,
          ),
        ],
      ),
    );
  }
}
