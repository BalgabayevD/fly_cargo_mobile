import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

class CodeInputPage extends StatefulWidget {
  final String phoneNumber;
  final String deviceId;
  final String preAuthSessionId;
  const CodeInputPage({
    required this.phoneNumber,
    required this.deviceId,
    required this.preAuthSessionId,
    super.key,
  });
  @override
  State<CodeInputPage> createState() => _CodeInputPageState();
}

class _CodeInputPageState extends State<CodeInputPage> {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocusNode = FocusNode();
  bool _isCodeComplete = false;
  bool _agreedToTerms = false;
  int _resendTimer = 119;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _codeController.addListener(_checkCodeComplete);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocusNode.dispose();
    super.dispose();
  }

  void _startResendTimer() {
    _resendTimer = 119;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          _resendTimer--;
        });
        return _resendTimer > 0;
      }
      return false;
    });
  }

  void _checkCodeComplete() {
    final code = _codeController.text.replaceAll(RegExp(r'[^\d]'), '');
    final isComplete = code.length == 6;
    if (_isCodeComplete != isComplete) {
      setState(() {
        _isCodeComplete = isComplete;
      });
    }
  }

  void _onCodeSubmitted() {
    if (_isCodeComplete && _agreedToTerms) {
      final code = _codeController.text.replaceAll(RegExp(r'[^\d]'), '');
      context.read<AuthBloc>().add(
        AuthVerifyCodeRequested(phoneNumber: widget.phoneNumber, code: code),
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
          onPressed: () => context.pop(),
          variant: AppButtonVariant.ghost,
        ),
        title: Text('Подтвердить', style: AppTypography.h6),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is AuthAuthenticated && previous is! AuthAuthenticated;
        },
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go(AppRoutes.home);
          }
        },
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) {
            return current is AuthError || current is AuthCodeSent;
          },
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Код отправлен повторно'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.lg),
                  Text(
                    'СМС код',
                    style: AppTypography.h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Мы отправили 6 значный код по смс\nна номер ${widget.phoneNumber}',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xxl),
                  Text(
                    'Код',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs),
                  TextFormField(
                    controller: _codeController,
                    focusNode: _codeFocusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: AppTypography.h5,
                    decoration: InputDecoration(
                      hintText: '144 356',
                      hintStyle: AppTypography.h5.copyWith(
                        color: AppColors.textTertiary,
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
                        borderSide: BorderSide(color: AppColors.error),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMD,
                        ),
                        borderSide: BorderSide(
                          color: AppColors.error,
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
                    onFieldSubmitted: (_) => _onCodeSubmitted(),
                  ),
                  SizedBox(height: AppSpacing.lg),
                  _CheckboxWithText(
                    value: _agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  SizedBox(height: AppSpacing.xxl),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return AppButton(
                        text: 'Отправить',
                        onPressed:
                            _isCodeComplete && _agreedToTerms && !isLoading
                            ? _onCodeSubmitted
                            : null,
                        size: AppButtonSize.large,
                        variant: AppButtonVariant.primary,
                        isFullWidth: true,
                        isLoading: isLoading,
                      );
                    },
                  ),
                  SizedBox(height: AppSpacing.md),
                  Center(
                    child: Text(
                      'Повторный код через $_resendTimer сек',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
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

class _CheckboxWithText extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const _CheckboxWithText({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: value ? AppColors.primary : AppColors.border,
                width: 2,
              ),
              color: value ? AppColors.primary : Colors.transparent,
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                ),
                children: [
                  const TextSpan(text: 'Я ознакомился и согласен с '),
                  TextSpan(
                    text: 'политикой использования',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(text: ' и '),
                  TextSpan(
                    text: 'условиями оферты',
                    style: TextStyle(color: AppColors.primary),
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
