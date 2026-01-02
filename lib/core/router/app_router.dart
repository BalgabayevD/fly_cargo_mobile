import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/go_router_refresh_stream.dart';
import 'package:fly_cargo/core/router/main_scaffold_shell.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/auth/presentation/pages/code_input_page.dart';
import 'package:fly_cargo/features/auth/presentation/pages/phone_input_page.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_page.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/description_form_page.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/recipient_form_page.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/recipient_page.dart';
import 'package:fly_cargo/features/onboarding/onboarding_video.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_detail_loader_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_detail_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_order_detail_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/orders_list_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/contacts_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/profile_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/settings_page.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const onboarding = '/';
  static const login = '/login';
  static const verify = '/verify';

  // Main Shell
  static const home = '/home';
  static const orders = '/orders';
  static const settings = '/settings';

  // Home Sub-pages
  static const descriptionForm = 'description-form';
  static const recipientForm = 'recipient-form'; // Or recipient page?
  static const recipientPage = 'recipient';

  // Orders Sub-pages
  static const orderDetail = 'order-detail';

  // Settings Sub-pages
  static const profile = 'profile';
  static const contacts = 'contacts';
  static const notifications = 'notifications';

  // User Demo Flow
  static const userDemo = '/user-demo';
  static const userProfile = 'profile';
  static const userPayments = 'payments';
  static const userCards = 'cards';
  static const userHistory = 'history';
  static const userCalculator = 'calculator';
  static const userEditProfile = 'edit';
  static const userNotifications = 'notifications';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _ordersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter createRouter(AuthBloc authBloc, String initialLocation) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final isLoggingIn =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.verify;
      final isOnboarding = state.matchedLocation == AppRoutes.onboarding;

      if (authState is AuthAuthenticated) {
        if (isLoggingIn || isOnboarding) {
          return AppRoutes.home;
        }
      } else {
        final location = state.matchedLocation;

        // Список разрешенных маршрутов для неавторизованных пользователей
        // Включает главные экраны, логин и демо-режим
        if (location == AppRoutes.home ||
            location.startsWith('${AppRoutes.home}/') ||
            location == AppRoutes.orders ||
            location.startsWith('${AppRoutes.orders}/') ||
            location == AppRoutes.settings ||
            location.startsWith('${AppRoutes.settings}/') ||
            location == AppRoutes.userDemo ||
            location.startsWith('${AppRoutes.userDemo}/') ||
            location == AppRoutes.login ||
            location == AppRoutes.verify ||
            location == AppRoutes.onboarding) {
          return null;
        }

        return AppRoutes.onboarding;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const PhoneInputPage(),
      ),
      GoRoute(
        path: AppRoutes.verify,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null) {
            return const Scaffold(
              body: Center(child: Text('Missing arguments for verification')),
            );
          }
          return CodeInputPage(
            phoneNumber: extra['phoneNumber'] as String,
            deviceId: extra['deviceId'] as String,
            preAuthSessionId: extra['preAuthSessionId'] as String,
          );
        },
      ),

      // Main App Shell
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffoldShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const CreateOrderPage(),
                // CreateOrderPage(),
                routes: [
                  GoRoute(
                    path: AppRoutes.descriptionForm,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final initialDescription = state.extra as String?;
                      return DescriptionFormPage(
                        initialDescription: initialDescription,
                      );
                    },
                  ),
                  GoRoute(
                    path: AppRoutes.recipientPage,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const RecipientPage(),
                  ),
                  GoRoute(
                    path: AppRoutes.recipientForm,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const RecipientFormPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _ordersNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.orders,
                builder: (context, state) => const OrdersListPage(),
                routes: [
                  GoRoute(
                    path: '${AppRoutes.orderDetail}/:orderId',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final orderIdStr = state.pathParameters['orderId'];

                      // Попытка получить order из extra (при переходе из списка)
                      final extra = state.extra as Map<String, dynamic>?;

                      if (extra != null && extra.containsKey('order')) {
                        // Переход из списка с передачей полного объекта
                        final userType = extra['userType'] as UserType;
                        final order = extra['order'] as OrderModel;

                        // Проверяем тип пользователя и показываем соответствующую страницу
                        if (userType.isCourier) {
                          return CourierOrderDetailPage(
                            order: order,
                            userType: userType,
                          );
                        } else {
                          return ClientOrderDetailPage(
                            order: order,
                            userType: userType,
                          );
                        }
                      }

                      // Если нет extra (DevTools, deep link, etc.) - загружаем заказ по ID
                      if (orderIdStr == null || orderIdStr.isEmpty) {
                        return const Scaffold(
                          body: Center(
                            child: Text('Ошибка: не указан ID заказа'),
                          ),
                        );
                      }

                      // Определяем тип пользователя для загрузчика
                      // TODO: Получить из контекста AuthBloc
                      // Пока используем клиентский загрузчик по умолчанию
                      return OrderDetailLoaderPage(orderId: orderIdStr);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: AppRoutes.profile,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ProfilePage(),
                  ),
                  GoRoute(
                    path: AppRoutes.contacts,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ContactsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
