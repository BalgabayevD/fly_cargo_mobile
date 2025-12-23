import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class AuthRouter {
  static Future<void> navigateToPhoneInput(BuildContext context) {
    return context.push(AppRoutes.login);
  }

  static Future<void> navigateToCodeInput(
    BuildContext context, {
    required String phoneNumber,
    required String deviceId,
    required String preAuthSessionId,
  }) {
    return context.push(
      AppRoutes.verify,
      extra: {
        'phoneNumber': phoneNumber,
        'deviceId': deviceId,
        'preAuthSessionId': preAuthSessionId,
      },
    );
  }

  static Future<void> replaceWithCodeInput(
    BuildContext context, {
    required String phoneNumber,
    required String deviceId,
    required String preAuthSessionId,
  }) {
    context.pushReplacement(
      AppRoutes.verify,
      extra: {
        'phoneNumber': phoneNumber,
        'deviceId': deviceId,
        'preAuthSessionId': preAuthSessionId,
      },
    );
    return Future.value();
  }
}
