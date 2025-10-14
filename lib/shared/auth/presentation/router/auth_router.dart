import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/auth/presentation/pages/code_input_page.dart';
import 'package:fly_cargo/shared/auth/presentation/pages/phone_input_page.dart';

/// Роутер для экранов аутентификации
class AuthRouter {
  static const String phoneInput = '/auth/phone-input';
  static const String codeInput = '/auth/code-input';

  /// Генерирует маршруты для аутентификации
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case phoneInput:
        return MaterialPageRoute(
          builder: (_) => const PhoneInputPage(),
          settings: settings,
        );

      case codeInput:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          throw ArgumentError('Missing required arguments for code input page');
        }

        return MaterialPageRoute(
          builder: (_) => CodeInputPage(
            phoneNumber: args['phoneNumber'] as String,
            deviceId: args['deviceId'] as String,
            preAuthSessionId: args['preAuthSessionId'] as String,
          ),
          settings: settings,
        );

      default:
        throw ArgumentError('Unknown route: ${settings.name}');
    }
  }

  /// Навигация к экрану ввода номера телефона
  static Future<void> navigateToPhoneInput(BuildContext context) {
    return Navigator.of(context).pushNamed(phoneInput);
  }

  /// Навигация к экрану ввода кода
  static Future<void> navigateToCodeInput(
    BuildContext context, {
    required String phoneNumber,
    required String deviceId,
    required String preAuthSessionId,
  }) {
    return Navigator.of(context).pushNamed(
      codeInput,
      arguments: {
        'phoneNumber': phoneNumber,
        'deviceId': deviceId,
        'preAuthSessionId': preAuthSessionId,
      },
    );
  }

  /// Замена текущего экрана на экран ввода кода
  static Future<void> replaceWithCodeInput(
    BuildContext context, {
    required String phoneNumber,
    required String deviceId,
    required String preAuthSessionId,
  }) {
    return Navigator.of(context).pushReplacementNamed(
      codeInput,
      arguments: {
        'phoneNumber': phoneNumber,
        'deviceId': deviceId,
        'preAuthSessionId': preAuthSessionId,
      },
    );
  }
}
