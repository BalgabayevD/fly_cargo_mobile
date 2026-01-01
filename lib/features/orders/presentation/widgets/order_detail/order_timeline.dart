import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class TimelineStep {
  final String title;
  final String date;
  final bool isCompleted;

  const TimelineStep({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

class OrderTimeline extends StatelessWidget {
  final List<TimelineStep> steps;

  const OrderTimeline({
    required this.steps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
          steps.length,
          (index) => _TimelineStepWidget(
            step: steps[index],
            isLast: index == steps.length - 1,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepWidget extends StatelessWidget {
  final TimelineStep step;
  final bool isLast;

  const _TimelineStepWidget({
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step.isCompleted ? Color(0xFF5C3A31) : AppColors.white,
                  border: Border.all(
                    color: step.isCompleted
                        ? Color(0xFF5C3A31)
                        : Color(0xFFE0E0E0),
                    width: 2,
                  ),
                ),
                child: step.isCompleted
                    ? Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 18,
                      )
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    color: Color(0xFFE0E0E0),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.surface5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    step.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.surface4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

