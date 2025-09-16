import 'package:flutter/material.dart';

class SelectBoxButton extends StatelessWidget {
  final VoidCallback onTap;

  const SelectBoxButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF007AFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            'Выбрать',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
