import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';

/// Экран ввода номера телефона для аутентификации
class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});

  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidPhone = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
    final phone = _phoneController.text;
    final isValid = _isValidPhoneNumber(phone);
    if (_isValidPhone != isValid) {
      setState(() {
        _isValidPhone = isValid;
      });
    }
  }

  bool _isValidPhoneNumber(String phone) {
    // Убираем все символы кроме цифр
    final digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');
    // Проверяем, что номер начинается с 7 или 8 и содержит 11 цифр
    return digitsOnly.length == 11 &&
        (digitsOnly.startsWith('7') || digitsOnly.startsWith('8'));
  }

  String _formatPhoneNumber(String phone) {
    // Убираем все символы кроме цифр
    final digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) return '';

    // Если номер начинается с 8, заменяем на 7
    String workingDigits = digitsOnly.startsWith('8')
        ? '7${digitsOnly.substring(1)}'
        : digitsOnly;

    // Если номер начинается с 7, убираем первую 7
    if (workingDigits.startsWith('7') && workingDigits.length > 1) {
      workingDigits = workingDigits.substring(1);
    }

    // Форматируем как +7 (XXX) XXX-XX-XX
    String formatted = '+7';

    if (workingDigits.isNotEmpty) {
      formatted +=
          ' (${workingDigits.substring(0, workingDigits.length > 3 ? 3 : workingDigits.length)}';

      if (workingDigits.length > 3) {
        final remaining = workingDigits.substring(3);
        formatted +=
            ') ${remaining.substring(0, remaining.length > 3 ? 3 : remaining.length)}';

        if (remaining.length > 3) {
          final lastPart = remaining.substring(3);
          formatted +=
              '-${lastPart.substring(0, lastPart.length > 2 ? 2 : lastPart.length)}';

          if (lastPart.length > 2) {
            formatted += '-${lastPart.substring(2)}';
          }
        }
      }
    }

    return formatted;
  }

  void _onPhoneSubmitted() {
    if (_formKey.currentState?.validate() ?? false) {
      final phone = _phoneController.text.replaceAll(RegExp(r'[^\d]'), '');
      // Если номер начинается с 8, заменяем на 7
      final formattedPhone = phone.startsWith('8')
          ? '+7${phone.substring(1)}'
          : phone.startsWith('7')
          ? '+$phone'
          : '+7$phone';

      context.read<AuthBloc>().add(
        AuthSignInRequested(phoneNumber: formattedPhone),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: AppIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.of(context).pop(),
          variant: AppButtonVariant.ghost,
        ),
        title: Text('Вход в систему', style: AppTypography.h6),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is AuthCodeSent) {
            // Переходим на экран ввода кода
            Navigator.of(context).pushReplacementNamed(
              '/auth/code-input',
              arguments: {
                'phoneNumber': state.phoneNumber,
                'deviceId': state.deviceId,
                'preAuthSessionId': state.preAuthSessionId,
              },
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 2),

                  // Иконка телефона
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusRound,
                        ),
                      ),
                      child: Icon(
                        Icons.phone_android,
                        size: AppSpacing.iconSizeXL,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: AppSpacing.xxl),

                  // Заголовок
                  Text(
                    'Введите номер телефона',
                    style: AppTypography.h3,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: AppSpacing.md),

                  // Описание
                  Text(
                    'Мы отправим SMS-код для подтверждения номера',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: AppSpacing.xxxl),

                  // Поле ввода телефона
                  TextFormField(
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        18,
                      ), // +7 (XXX) XXX-XX-XX = 18 символов
                    ],
                    decoration: InputDecoration(
                      labelText: 'Номер телефона',
                      hintText: '+7 (XXX) XXX-XX-XX',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppColors.textSecondary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLG,
                        ),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLG,
                        ),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLG,
                        ),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLG,
                        ),
                        borderSide: BorderSide(color: AppColors.error),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLG,
                        ),
                        borderSide: BorderSide(
                          color: AppColors.error,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер телефона';
                      }
                      if (!_isValidPhoneNumber(value)) {
                        return 'Введите корректный номер телефона';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Автоматически форматируем номер
                      final formatted = _formatPhoneNumber(value);
                      if (formatted != value) {
                        final cursorPosition =
                            _phoneController.selection.baseOffset;
                        _phoneController.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(
                            offset: cursorPosition <= formatted.length
                                ? cursorPosition
                                : formatted.length,
                          ),
                        );
                      }
                      _onPhoneChanged();
                    },
                    onFieldSubmitted: (_) => _onPhoneSubmitted(),
                  ),

                  SizedBox(height: AppSpacing.xxxl),

                  // Кнопка отправки
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;

                      return AppButton(
                        text: 'Отправить код',
                        onPressed: _isValidPhone && !isLoading
                            ? _onPhoneSubmitted
                            : null,
                        size: AppButtonSize.large,
                        variant: AppButtonVariant.primary,
                        isFullWidth: true,
                        isLoading: isLoading,
                      );
                    },
                  ),

                  const Spacer(flex: 3),

                  // Информация о конфиденциальности
                  Text(
                    'Нажимая "Отправить код", вы соглашаетесь с условиями использования и политикой конфиденциальности',
                    style: AppTypography.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
