import 'package:flutter/material.dart';

class PeriodSelectorWidget extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String> onPeriodChanged;

  const PeriodSelectorWidget({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPeriodChip('today', 'Сегодня'),
        const SizedBox(width: 8),
        _buildPeriodChip('week', 'Неделя'),
        const SizedBox(width: 8),
        _buildPeriodChip('month', 'Месяц'),
        const SizedBox(width: 8),
        _buildPeriodChip('total', 'Всего'),
      ],
    );
  }

  Widget _buildPeriodChip(String value, String label) {
    final isSelected = selectedPeriod == value;
    return GestureDetector(
      onTap: () => onPeriodChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007AFF) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }
}
