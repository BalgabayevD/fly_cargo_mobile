import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fly_cargo/features/auth/presentation/phone_input_screen.dart';
import 'package:fly_cargo/features/auth/presentation/verify_code_screen.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';
import 'package:fly_cargo/features/map/presentation/yandex_map_screen.dart';
import 'package:fly_cargo/services/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final authService = AuthService();
    final isAuthenticated = await authService.isAuthenticated();
    
    // Публичные маршруты (не требуют авторизации)
    final publicRoutes = ['/', '/auth/phone', '/auth/verify-code'];
    final isPublicRoute = publicRoutes.contains(state.matchedLocation);
    
    // Если пользователь не авторизован и пытается попасть на защищенную страницу
    if (!isAuthenticated && !isPublicRoute) {
      return '/auth/phone';
    }
    
    // Если пользователь авторизован и находится на странице авторизации
    if (isAuthenticated && (state.matchedLocation == '/auth/phone' || state.matchedLocation == '/auth/verify-code')) {
      return '/home';
    }
    
    return null; // Не перенаправляем
  },
  routes: [
    // Публичная страница - карта
    GoRoute(
      path: '/',
      name: 'map',
      builder: (context, state) => const YandexMapScreen(),
    ),
    
    // Маршруты авторизации (публичные)
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
    
    // Защищенные маршруты (требуют авторизации)
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
