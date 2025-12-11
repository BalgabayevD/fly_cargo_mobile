import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ColorPalettePage extends StatelessWidget {
  const ColorPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цветовая палитра'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        children: [
          _buildSection(
            context,
            'Основные цвета бренда',
            [
              _ColorInfo('Primary', AppColors.primary, '#E47B35'),
              _ColorInfo('Primary Light', AppColors.primaryLight, '#FF9A5C'),
              _ColorInfo('Primary Dark', AppColors.primaryDark, '#C86020'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Вторичные цвета',
            [
              _ColorInfo('Secondary', AppColors.secondary, '#FFE4D2'),
              _ColorInfo(
                'Secondary Light',
                AppColors.secondaryLight,
                '#FFF3E9',
              ),
              _ColorInfo('Secondary Dark', AppColors.secondaryDark, '#FFD1B3'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Системные цвета',
            [
              _ColorInfo('Success', AppColors.success, '#34C759'),
              _ColorInfo('Warning', AppColors.warning, '#FFC107'),
              _ColorInfo('Error', AppColors.error, '#FF3B30'),
              _ColorInfo('Info', AppColors.info, '#2196F3'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Серые тона',
            [
              _ColorInfo('Gray 50', AppColors.gray50, '#F8F9FA'),
              _ColorInfo('Gray 100', AppColors.gray100, '#F5F5F5'),
              _ColorInfo('Gray 200', AppColors.gray200, '#EEEEEE'),
              _ColorInfo('Gray 300', AppColors.gray300, '#E0E0E0'),
              _ColorInfo('Gray 400', AppColors.gray400, '#D0CFCE'),
              _ColorInfo('Gray 500', AppColors.gray500, '#999999'),
              _ColorInfo('Gray 600', AppColors.gray600, '#666666'),
              _ColorInfo('Gray 700', AppColors.gray700, '#333333'),
              _ColorInfo('Gray 800', AppColors.gray800, '#1A1A1A'),
              _ColorInfo('Gray 900', AppColors.gray900, '#0D0D0D'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Цвета текста',
            [
              _ColorInfo('Text Primary', AppColors.textPrimary, '#333333'),
              _ColorInfo('Text Secondary', AppColors.textSecondary, '#666666'),
              _ColorInfo('Text Tertiary', AppColors.textTertiary, '#999999'),
              _ColorInfo('Text Disabled', AppColors.textDisabled, '#D0CFCE'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Цвета иконок',
            [
              _ColorInfo('Icon Primary', AppColors.iconPrimary, '#333333'),
              _ColorInfo('Icon Secondary', AppColors.iconSecondary, '#666666'),
              _ColorInfo('Icon Tertiary', AppColors.iconTertiary, '#999999'),
              _ColorInfo('Icon Disabled', AppColors.iconDisabled, '#D0CFCE'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Акцентные цвета',
            [
              _ColorInfo('Blue', AppColors.accentBlue, '#2196F3'),
              _ColorInfo('Green', AppColors.accentGreen, '#34C759'),
              _ColorInfo('Orange', AppColors.accentOrange, '#E47B35'),
              _ColorInfo('Red', AppColors.accentRed, '#FF3B30'),
              _ColorInfo('Purple', AppColors.accentPurple, '#AF52DE'),
              _ColorInfo('Yellow', AppColors.accentYellow, '#FFC107'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Цвета фона',
            [
              _ColorInfo('Background', AppColors.background, '#FFFFFF'),
              _ColorInfo('Surface', AppColors.surface, '#F8F9FA'),
              _ColorInfo(
                'Surface Variant',
                AppColors.surfaceVariant,
                '#F5F5F5',
              ),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildSection(
            context,
            'Цвета границ',
            [
              _ColorInfo('Border', AppColors.border, '#E0E0E0'),
              _ColorInfo('Border Light', AppColors.borderLight, '#E9ECEF'),
              _ColorInfo('Border Dark', AppColors.borderDark, '#D0CFCE'),
            ],
          ),
          DesignUtils.verticalSpaceLG,
          _buildGradientsSection(context),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<_ColorInfo> colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h5),
        DesignUtils.verticalSpaceMD,
        ...colors.map((colorInfo) => _buildColorTile(context, colorInfo)),
      ],
    );
  }

  Widget _buildColorTile(BuildContext context, _ColorInfo colorInfo) {
    final isLightColor = _isLightColor(colorInfo.color);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () => _copyToClipboard(context, colorInfo.hex),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: colorInfo.color,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      colorInfo.name,
                      style: AppTypography.bodyMedium.copyWith(
                        color: isLightColor
                            ? AppColors.textPrimary
                            : AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    DesignUtils.verticalSpaceXS,
                    Text(
                      colorInfo.hex,
                      style: AppTypography.bodySmall.copyWith(
                        color: isLightColor
                            ? AppColors.textSecondary
                            : AppColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.content_copy,
                  size: AppSpacing.iconSizeMD,
                  color: isLightColor
                      ? AppColors.iconSecondary
                      : AppColors.white.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Градиенты', style: AppTypography.h5),
        DesignUtils.verticalSpaceMD,
        _buildGradientTile('Primary Gradient', AppColors.primaryGradient),
        DesignUtils.verticalSpaceSM,
        _buildGradientTile('Secondary Gradient', AppColors.secondaryGradient),
        DesignUtils.verticalSpaceSM,
        _buildGradientTile(
          'Primary Dark Gradient',
          AppColors.primaryDarkGradient,
        ),
      ],
    );
  }

  Widget _buildGradientTile(String name, Gradient gradient) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      ),
      child: Center(
        child: Text(
          name,
          style: AppTypography.h6.copyWith(
            color: AppColors.white,
            shadows: [
              const Shadow(
                color: AppColors.black,
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isLightColor(Color color) {
    final luminance = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
    return luminance > 0.5;
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    DesignUtils.showSnackBar(
      context,
      message: 'Скопировано: $text',
      type: SnackBarType.success,
    );
  }
}

class _ColorInfo {
  final String name;
  final Color color;
  final String hex;

  _ColorInfo(this.name, this.color, this.hex);
}
