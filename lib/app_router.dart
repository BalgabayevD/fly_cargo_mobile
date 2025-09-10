import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fly_cargo/features/auth/presentation/phone_input_screen.dart';
import 'package:fly_cargo/features/auth/presentation/verify_code_screen.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth/phone',
  routes: [
    GoRoute(
      path: '/auth/phone',
      name: 'phone-input',
      builder: (context, state) => const PhoneInputScreen(),
    ),
    GoRoute(
      path: '/auth/verify-code',
      name: 'verify-code',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        if (extra == null) {
          return const Scaffold(
            body: Center(
              child: Text('Ошибка: отсутствуют данные для подтверждения'),
            ),
          );
        }
        
        return VerifyCodeScreen(
          phoneNumber: extra['phoneNumber'] as String,
          deviceId: extra['deviceId'] as String,
          preAuthSessionId: extra['preAuthSessionId'] as String,
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
