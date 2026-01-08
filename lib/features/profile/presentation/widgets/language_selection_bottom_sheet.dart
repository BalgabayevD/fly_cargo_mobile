import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:heroicons/heroicons.dart';

class LanguageSelectionBottomSheet extends StatefulWidget {
  const LanguageSelectionBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    final languageChanged = await showModalBottomSheet<bool>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: false,
      builder: (context) => const LanguageSelectionBottomSheet(),
    );

    if (languageChanged == true && context.mounted) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (context.mounted) {
        await show(context);
      }
    }
  }

  @override
  State<LanguageSelectionBottomSheet> createState() =>
      _LanguageSelectionBottomSheetState();
}

class _LanguageSelectionBottomSheetState
    extends State<LanguageSelectionBottomSheet> {
  String? _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    _selectedLanguageCode = context.read<LocaleCubit>().state.languageCode;
  }

  String _getLanguageName(BuildContext context, String languageCode) {
    switch (languageCode) {
      case 'en':
        return context.l10n.english;
      case 'kk':
        return context.l10n.kazakh;
      case 'ru':
      default:
        return context.l10n.russian;
    }
  }

  void _onLanguageSelected(String languageCode) {
    setState(() {
      _selectedLanguageCode = languageCode;
    });
  }

  void _onSave() {
    if (_selectedLanguageCode != null) {
      final currentLocale = context.read<LocaleCubit>().state.languageCode;
      final languageChanged = currentLocale != _selectedLanguageCode;

      context.read<LocaleCubit>().changeLocale(Locale(_selectedLanguageCode!));
      Navigator.pop(context, languageChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageSelectionHeader(
            onClose: () => Navigator.pop(context, false),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Column(
              children: [
                _LanguageOptionWidget(
                  languageCode: 'kk',
                  languageName: _getLanguageName(context, 'kk'),
                  isSelected: _selectedLanguageCode == 'kk',
                  onTap: () => _onLanguageSelected('kk'),
                ),

                const SizedBox(height: AppSpacing.sm),
                _LanguageOptionWidget(
                  languageCode: 'ru',
                  languageName: _getLanguageName(context, 'ru'),
                  isSelected: _selectedLanguageCode == 'ru',
                  onTap: () => _onLanguageSelected('ru'),
                ),
                const SizedBox(height: AppSpacing.sm),
                _LanguageOptionWidget(
                  languageCode: 'en',
                  languageName: _getLanguageName(context, 'en'),
                  isSelected: _selectedLanguageCode == 'en',
                  onTap: () => _onLanguageSelected('en'),
                ),
              ],
            ),
          ),
          _SaveButton(
            isEnabled: _selectedLanguageCode != null,
            onPressed: _onSave,
            bottomPadding: bottomPadding,
          ),
        ],
      ),
    );
  }
}

class _LanguageSelectionHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _LanguageSelectionHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.appLanguage,
              style: AppTypography.h5,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: HeroIcon(
              HeroIcons.xMark,
              size: 24,
              color: AppColors.surface4,
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

class _LanguageOptionWidget extends StatelessWidget {
  final String languageCode;
  final String languageName;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOptionWidget({
    required this.languageCode,
    required this.languageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surface2,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            _RadioIndicator(isSelected: isSelected),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                languageName,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColors.surface5 : AppColors.surface4,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  final bool isSelected;

  const _RadioIndicator({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: 2,
        ),
        color: isSelected ? AppColors.white : AppColors.none,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
            )
          : null,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final double bottomPadding;

  const _SaveButton({
    required this.isEnabled,
    required this.onPressed,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: bottomPadding + AppSpacing.lg,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.surface3,
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            ),
          ),
          child: Text(
            context.l10n.save,
            style: AppTypography.buttonLarge,
          ),
        ),
      ),
    );
  }
}
