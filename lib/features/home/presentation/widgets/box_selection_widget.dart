import 'package:flutter/material.dart';

class BoxSelectionWidget extends StatefulWidget {
  final String? selectedBoxType;
  final Function(String) onBoxSelected;

  const BoxSelectionWidget({
    super.key,
    required this.selectedBoxType,
    required this.onBoxSelected,
  });

  @override
  State<BoxSelectionWidget> createState() => _BoxSelectionWidgetState();
}

class _BoxSelectionWidgetState extends State<BoxSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BoxOptionWidget(
            type: 'small',
            title: 'Маленькая',
            subtitle: '15 × 10 × 20',
            imagePath: 'assets/images/small.png',
            isSelected: widget.selectedBoxType == 'small',
            onTap: () => widget.onBoxSelected('small'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BoxOptionWidget(
            type: 'medium',
            title: 'Средняя',
            subtitle: '20 × 20 × 30',
            imagePath: 'assets/images/medium.png',
            isSelected: widget.selectedBoxType == 'medium',
            onTap: () => widget.onBoxSelected('medium'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BoxOptionWidget(
            type: 'big',
            title: 'Большая',
            subtitle: '30 × 30 × 40',
            imagePath: 'assets/images/big.png',
            isSelected: widget.selectedBoxType == 'big',
            onTap: () => widget.onBoxSelected('big'),
          ),
        ),
      ],
    );
  }
}

class BoxOptionWidget extends StatelessWidget {
  final String type;
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const BoxOptionWidget({
    super.key,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imagePath,
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
              ? const Color(0xFF007AFF).withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF007AFF)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
