import 'package:flutter/material.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_confirm_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:fly_cargo/features/onboarding/onboarding_screen.dart';
// import 'package:fly_cargo/features/profile/presentation/pages/contacts_page.dart';
// import 'package:fly_cargo/features/profile/presentation/pages/profile_page.dart';
// import 'package:fly_cargo/features/profile/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const onboarding = '/';
  static const login = '/login';
  static const verify = '/verify';

  // Main Shell
  static const home = '/home';
  static const orders = '/orders';
  // static const settings = SettingsPage.path;

  // Home Sub-pages
  static const descriptionForm = 'description-form';
  static const recipientForm = 'recipient-form'; // Or recipient page?
  static const recipientPage = 'recipient';

  // Orders Sub-pages
  static const orderDetail = 'order-detail';

  // Settings Sub-pages
  // static const profile = ProfilePage.path;
  // static const contacts = ContactsPage.path;
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

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _ordersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: initialLocation,
    // refreshListenable: GoRouterRefreshStream(authBloc.stream),
    // redirect: (context, state) {
    //   final authState = authBloc.state;
    //   final isLoggingIn =
    //       state.matchedLocation == AppRoutes.login ||
    //       state.matchedLocation == AppRoutes.verify;
    //   final isOnboarding = state.matchedLocation == AppRoutes.onboarding;
    //
    //   if (authState is AuthAuthenticated) {
    //     if (isLoggingIn || isOnboarding) {
    //       return AppRoutes.home;
    //     }
    //   } else {
    //     final location = state.matchedLocation;
    //
    //     // Список разрешенных маршрутов для неавторизованных пользователей
    //     // Включает главные экраны, логин и демо-режим
    //     if (location == AppRoutes.home ||
    //         location.startsWith('${AppRoutes.home}/') ||
    //         location == AppRoutes.orders ||
    //         location.startsWith('${AppRoutes.orders}/') ||
    //         location == AppRoutes.settings ||
    //         location.startsWith('${AppRoutes.settings}/') ||
    //         location == AppRoutes.userDemo ||
    //         location.startsWith('${AppRoutes.userDemo}/') ||
    //         location == AppRoutes.login ||
    //         location == AppRoutes.verify ||
    //         location == AppRoutes.onboarding) {
    //       return null;
    //     }
    //
    //     return AppRoutes.onboarding;
    //   }
    //
    //   return null;
    // },
    routes: [
      OnboardingScreen.route(),
      AuthorizationRequestScreen.route(),
      AuthorizationConfirmScreen.route(),
      //
      //   GoRoute(
      //     path: AppRoutes.verify,
      //     builder: (context, state) {
      //       final extra = state.extra as Map<String, dynamic>?;
      //       if (extra == null) {
      //         return const Scaffold(
      //           body: Center(child: Text('Missing arguments for verification')),
      //         );
      //       }
      //       return CodeInputPage(
      //         phoneNumber: extra['phoneNumber'] as String,
      //         deviceId: extra['deviceId'] as String,
      //         preAuthSessionId: extra['preAuthSessionId'] as String,
      //       );
      //     },
      //   ),
      //
      //   // Main App Shell
      //   StatefulShellRoute.indexedStack(
      //     builder: (context, state, navigationShell) {
      //       return MainScaffoldShell(navigationShell: navigationShell);
      //     },
      //     branches: [
      //       StatefulShellBranch(
      //         navigatorKey: _homeNavigatorKey,
      //         routes: [
      //           GoRoute(
      //             path: AppRoutes.home,
      //             builder: (context, state) => const CreateOrderPage(),
      //             routes: [
      //               GoRoute(
      //                 path: AppRoutes.descriptionForm,
      //                 parentNavigatorKey: _rootNavigator,
      //                 builder: (context, state) {
      //                   final initialDescription = state.extra as String?;
      //                   return DescriptionFormPage(
      //                     initialDescription: initialDescription,
      //                   );
      //                 },
      //               ),
      //               GoRoute(
      //                 path: AppRoutes.recipientPage,
      //                 parentNavigatorKey: _rootNavigator,
      //                 builder: (context, state) => const RecipientPage(),
      //               ),
      //               GoRoute(
      //                 path: AppRoutes.recipientForm,
      //                 parentNavigatorKey: _rootNavigator,
      //                 builder: (context, state) => const RecipientFormPage(),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //       StatefulShellBranch(
      //         navigatorKey: _ordersNavigatorKey,
      //         routes: [
      //           GoRoute(
      //             path: AppRoutes.orders,
      //             builder: (context, state) => const OrdersListPage(),
      //             routes: [
      //               GoRoute(
      //                 path: '${AppRoutes.orderDetail}/:orderId',
      //                 parentNavigatorKey: _rootNavigator,
      //                 builder: (context, state) {
      //                   final orderIdStr = state.pathParameters['orderId'];
      //
      //                   if (orderIdStr == null || orderIdStr.isEmpty) {
      //                     return const Scaffold(
      //                       body: Center(
      //                         child: Text('Ошибка: не указан ID заказа'),
      //                       ),
      //                     );
      //                   }
      //
      //                   return OrderDetailLoaderPage(orderId: orderIdStr);
      //                 },
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //       StatefulShellBranch(
      //         navigatorKey: _settingsNavigatorKey,
      //         routes: [
      //           SettingsPage.route(
      //             routes: [
      //               ProfilePage.route(parentNavigatorKey: _rootNavigator),
      //               ContactsPage.route(parentNavigatorKey: _rootNavigator),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
    ],
  );
}
