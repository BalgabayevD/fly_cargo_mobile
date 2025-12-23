import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/auth/presentation/router/auth_router.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldText = oldValue.text;
    final newText = newValue.text;
    final oldDigits = oldText.replaceAll(RegExp(r'[^\d]'), '');
    final newDigits = newText.replaceAll(RegExp(r'[^\d]'), '');
    if (newDigits.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }
    String workingDigits = newDigits.startsWith('8')
        ? '7${newDigits.substring(1)}'
        : newDigits;
    if (workingDigits.startsWith('7') && workingDigits.length > 1) {
      workingDigits = workingDigits.substring(1);
    }
    if (workingDigits.length > 10) {
      workingDigits = workingDigits.substring(0, 10);
    }
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
    final isDeletion = newDigits.length < oldDigits.length;
    final oldCursorOffset = oldValue.selection.baseOffset;
    final oldTextBeforeCursor = oldText.substring(0, oldCursorOffset);
    final oldDigitsBeforeCursor = oldTextBeforeCursor
        .replaceAll(RegExp(r'[^\d]'), '')
        .length;
    final newCursorOffset = newValue.selection.baseOffset;
    final newTextBeforeCursor = newText.substring(0, newCursorOffset);
    final newDigitsBeforeCursor = newTextBeforeCursor
        .replaceAll(RegExp(r'[^\d]'), '')
        .length;
    final digitsBeforeCursor = isDeletion
        ? oldDigitsBeforeCursor
        : newDigitsBeforeCursor;
    int digitCount = 0;
    int cursorPosition = formatted.length;
    for (int i = 0; i < formatted.length; i++) {
      if (RegExp(r'\d').hasMatch(formatted[i])) {
        digitCount++;
        if (digitCount > digitsBeforeCursor) {
          cursorPosition = i + 1;
          break;
        }
      }
    }
    if (digitCount <= digitsBeforeCursor) {
      cursorPosition = formatted.length;
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}

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
    final digitsOnly = phone.replaceAll(RegExp(r'[^\d]'), '');
    return digitsOnly.length == 11 &&
        (digitsOnly.startsWith('7') || digitsOnly.startsWith('8'));
  }

  void _onPhoneSubmitted() {
    if (_formKey.currentState?.validate() ?? false) {
      final phone = _phoneController.text.replaceAll(RegExp(r'[^\d]'), '');
      final formattedPhone = phone.startsWith('8')
          ? '+7${phone.substring(1)}'
          : phone.startsWith('7')
          ? '+$phone'
          : '+7$phone';
      context.read<AuthBloc>().add(
        AuthRequestOTPRequested(phoneNumber: formattedPhone),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: AppIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.of(context).pop(),
          variant: AppButtonVariant.ghost,
        ),
        title: Text('Авторизация', style: AppTypography.h6),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.danger,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is AuthCodeSent) {
            AuthRouter.replaceWithCodeInput(
              context,
              phoneNumber: state.phoneNumber,
              deviceId: state.deviceId,
              preAuthSessionId: state.preAuthSessionId,
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.lg),
                  Text(
                    'Номер телефона',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Поможет создавать и отслеживать\nваши заказы',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.surface4,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xxl),
                  Text(
                    'Номер телефона',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs),
                  TextFormField(
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneNumberFormatter(),
                      LengthLimitingTextInputFormatter(18),
                    ],
                    style: AppTypography.bodyLarge,
                    decoration: InputDecoration(
                      hintText: '+7 (777) 123-45-65',
                      hintStyle: AppTypography.bodyLarge.copyWith(
                        color: AppColors.surface5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(color: AppColors.danger),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(
                          color: AppColors.danger,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.md,
                      ),
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
                    onChanged: (_) {
                      _onPhoneChanged();
                    },
                    onFieldSubmitted: (_) => _onPhoneSubmitted(),
                  ),
                  SizedBox(height: AppSpacing.xxl),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return AppButton(
                        text: 'Получить код',
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
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
