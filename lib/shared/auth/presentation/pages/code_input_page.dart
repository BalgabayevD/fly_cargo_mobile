import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';


class CodeInputPage extends StatefulWidget {
  final String phoneNumber;
  final String deviceId;
  final String preAuthSessionId;

  const CodeInputPage({
    super.key,
    required this.phoneNumber,
    required this.deviceId,
    required this.preAuthSessionId,
  });

  @override
  State<CodeInputPage> createState() => _CodeInputPageState();
}

class _CodeInputPageState extends State<CodeInputPage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  int _currentIndex = 0;
  bool _isCodeComplete = false;
  int _resendTimer = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _focusNodes[0].requestFocus();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startResendTimer() {
    _resendTimer = 60;
    _canResend = false;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          _resendTimer--;
          if (_resendTimer <= 0) {
            _canResend = true;
          }
        });
        return _resendTimer > 0;
      }
      return false;
    });
  }

  void _onCodeChanged(int index, String value) {
    if (value.length == 1) {
      _controllers[index].text = value;


      if (index < 5) {
        _currentIndex = index + 1;
        _focusNodes[_currentIndex].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        _checkCodeComplete();
      }
    } else if (value.isEmpty && index > 0) {

      _currentIndex = index - 1;
      _focusNodes[_currentIndex].requestFocus();
    }

    _checkCodeComplete();
  }

  void _checkCodeComplete() {
    final code = _controllers.map((c) => c.text).join();
    final isComplete = code.length == 6;

    if (_isCodeComplete != isComplete) {
      setState(() {
        _isCodeComplete = isComplete;
      });
    }
  }

  void _onCodeSubmitted() {
    if (_isCodeComplete) {
      final code = _controllers.map((c) => c.text).join();

      context.read<AuthBloc>().add(
        AuthVerifyCodeRequested(phoneNumber: widget.phoneNumber, code: code),
      );
    }
  }

  void _onResendCode() {
    if (_canResend) {
      context.read<AuthBloc>().add(
        AuthRequestOTPRequested(phoneNumber: widget.phoneNumber),
      );
      _startResendTimer();
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
        title: Text('Подтверждение', style: AppTypography.h6),
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
          } else if (state is AuthAuthenticated) {


            Navigator.of(context).popUntil((route) => route.isFirst);
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),

                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusRound,
                      ),
                    ),
                    child: Icon(
                      Icons.sms,
                      size: AppSpacing.iconSizeXL,
                      color: AppColors.secondary,
                    ),
                  ),
                ),

                SizedBox(height: AppSpacing.xxl),

                Text(
                  'Введите код из SMS',
                  style: AppTypography.h3,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppSpacing.md),


                Text(
                  'Мы отправили код на номер\n${widget.phoneNumber}',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: AppSpacing.xxxl),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 60,
                      height: 60,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: AppTypography.h4,
                        decoration: InputDecoration(
                          counterText: '',
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
                        onChanged: (value) => _onCodeChanged(index, value),
                        onFieldSubmitted: (_) => _onCodeSubmitted(),
                      ),
                    );
                  }),
                ),

                SizedBox(height: AppSpacing.xxxl),


                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return AppButton(
                      text: 'Подтвердить',
                      onPressed: _isCodeComplete && !isLoading
                          ? _onCodeSubmitted
                          : null,
                      size: AppButtonSize.large,
                      variant: AppButtonVariant.primary,
                      isFullWidth: true,
                      isLoading: isLoading,
                    );
                  },
                ),

                SizedBox(height: AppSpacing.xl),


                if (_canResend)
                  AppButton(
                    text: 'Отправить код повторно',
                    onPressed: _onResendCode,
                    size: AppButtonSize.medium,
                    variant: AppButtonVariant.outline,
                    isFullWidth: true,
                  )
                else
                  Text(
                    'Повторная отправка через $_resendTimer сек',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                const Spacer(flex: 3),


                Text(
                  'Не получили код? Проверьте правильность номера или обратитесь в поддержку',
                  style: AppTypography.caption,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
