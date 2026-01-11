import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';

class AnalysisStatusMessage extends StatelessWidget {
  final AnalysisStatus status;

  const AnalysisStatusMessage({
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AnalysisStatus.none:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 20,
              color: AppColors.success,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Анализ завершен',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.success,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      case AnalysisStatus.morePhotoInside:
        return Text(
          'Сфотографируйте содержимое посылки',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.danger,
            fontWeight: FontWeight.w400,
          ),
        );
      case AnalysisStatus.morePhotoOutside:
        return Text(
          'Сфотографируйте посылку снаружи',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.danger,
            fontWeight: FontWeight.w400,
          ),
        );
    }
  }
}

