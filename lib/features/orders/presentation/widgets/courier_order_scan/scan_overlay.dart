import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:heroicons/heroicons.dart';

enum QRScannerOverlayVariant {
  success,
  failure,
  idle,
  loading,
}

class QRScannerOverlay extends StatelessWidget {
  final Color finderColor;
  final QRScannerOverlayVariant variant;

  const QRScannerOverlay({
    this.finderColor = BeColors.primary,
    this.variant = .idle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          painter: QRScannerPainter(
            scanAreaWidth: 320,
            scanAreaHeight: 220,
            borderRadius: 18,
            overlayColor: const Color(0x99000000),
          ),
        ),

        Center(
          child: Container(
            width: 320,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: finderColor,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),

        if (variant == .success)
          Center(
            child: HeroIcon(
              HeroIcons.checkCircle,
              color: BeColors.success,
              size: 56,
              style: .solid,
            ),
          ),

        if (variant == .failure)
          Center(
            child: HeroIcon(
              HeroIcons.xCircle,
              color: BeColors.danger,
              size: 56,
              style: .solid,
            ),
          ),

        if (variant == .loading)
          Center(
            child: CircularProgressIndicator(
              color: finderColor,
            ),
          ),
      ],
    );
  }
}

class QRScannerPainter extends CustomPainter {
  final double scanAreaWidth;
  final double scanAreaHeight;
  final double borderRadius;
  final Color overlayColor;

  QRScannerPainter({
    required this.scanAreaWidth,
    required this.scanAreaHeight,
    required this.borderRadius,
    required this.overlayColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = overlayColor;

    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: scanAreaWidth,
            height: scanAreaHeight,
          ),
          Radius.circular(borderRadius),
        ),
      );

    final overlayPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    canvas.drawPath(overlayPath, paint);
  }

  @override
  bool shouldRepaint(QRScannerPainter oldDelegate) => false;
}
