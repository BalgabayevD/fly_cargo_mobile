import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/auth/presentation/pages/phone_input_page.dart';
import 'package:heroicons/heroicons.dart';

/// Bottom sheet для ввода данных получателя
class ChooseRecipientBottomSheet extends StatefulWidget {
  final String? initialName;
  final String? initialPhone;

  const ChooseRecipientBottomSheet({
    this.initialName,
    this.initialPhone,
    super.key,
  });

  @override
  State<ChooseRecipientBottomSheet> createState() =>
      _ChooseRecipientBottomSheetState();
}

class _ChooseRecipientBottomSheetState
    extends State<ChooseRecipientBottomSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _phoneController = TextEditingController(text: widget.initialPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context, {
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXL),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок с кнопкой закрытия
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Получатель',
                      style: AppTypography.h5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: const HeroIcon(
                      HeroIcons.xMark,
                      size: 24,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Поля ввода
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Имя
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                        hintText: 'Введите имя',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                            width: AppSpacing.borderWidth,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                            width: AppSpacing.borderWidth,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: AppSpacing.borderWidthThick,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.surface,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                          vertical: AppSpacing.md,
                        ),
                      ),
                      style: AppTypography.bodyLarge,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите имя получателя';
                        }
                        if (value.trim().length < 2) {
                          return 'Имя должно содержать минимум 2 символа';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    // Номер телефона
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        PhoneNumberFormatter(),
                        LengthLimitingTextInputFormatter(18),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Номер телефона',
                        hintText: '+7 (XXX) XXX-XX-XX',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                            width: AppSpacing.borderWidth,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                            width: AppSpacing.borderWidth,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMD),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: AppSpacing.borderWidthThick,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.surface,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                          vertical: AppSpacing.md,
                        ),
                      ),
                      style: AppTypography.bodyLarge,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите номер телефона';
                        }
                        final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
                        if (digitsOnly.length < 10) {
                          return 'Введите корректный номер телефона';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Кнопка "Сохранить"
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                top: AppSpacing.lg,
                bottom: 56,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.lg,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                    ),
                  ),
                  child: Text(
                    'Сохранить',
                    style: AppTypography.buttonLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

