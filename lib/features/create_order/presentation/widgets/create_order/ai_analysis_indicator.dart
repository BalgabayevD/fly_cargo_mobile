import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class AIAnalysisIndicator extends StatefulWidget {
  const AIAnalysisIndicator({super.key});

  @override
  State<AIAnalysisIndicator> createState() => _AIAnalysisIndicatorState();
}

class _AIAnalysisIndicatorState extends State<AIAnalysisIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Row(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final scale = 1.0 + (0.1 * (_controller.value * 4 % 1));
                return Transform.scale(
                  scale: scale,
                  child: Icon(
                    Icons.auto_awesome,
                    size: 24,
                    color: AppColors.primary,
                  ),
                );
              },
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Row(
                children: List.generate(20, (index) {
                  final isActive = _progressAnimation.value >= (index + 1) / 20;
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 2,
                        right: index == 19 ? 0 : 2,
                      ),
                      height: 4,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.surface2,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

