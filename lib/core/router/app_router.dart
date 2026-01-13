import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/go_router_refresh_stream.dart';
import 'package:fly_cargo/core/router/main_scaffold_shell.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_confirm_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_page.dart';
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

GoRouter createRouter(
  AuthorizationBloc authorizationBloc,
  String initialLocation,
) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: initialLocation,
    refreshListenable: GoRouterRefreshStream(authorizationBloc.stream),
    redirect: (context, state) {
      final authorizationState = authorizationBloc.state;

      if (authorizationState is InitialAuthorizationState) {
        final isAuthorizationRequest =
            state.fullPath == AuthorizationRequestScreen.path;

        final isAuthorizationConfirm =
            state.fullPath == AuthorizationConfirmScreen.path;

        if (authorizationState.isShowOnboarding) {
          if (!isAuthorizationRequest && !isAuthorizationConfirm) {
            return OnboardingScreen.location();
          }
        }

        if (!authorizationState.isAuthenticated) {
          if (!isAuthorizationConfirm) {
            return AuthorizationRequestScreen.location();
          }
        }
      }

      return null;
    },
    routes: [
      OnboardingScreen.route(),
      AuthorizationRequestScreen.route(),
      AuthorizationConfirmScreen.route(),

      MainScaffoldShell.route(
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              CreateOrderScreen.route(
                routes: [
                  GoRoute(
                    path: AppRoutes.descriptionForm,
                    parentNavigatorKey: _rootNavigator,
                    builder: (context, state) {
                      final initialDescription = state.extra as String?;
                      return Text('1');
                      // return DescriptionFormPage(
                      //   initialDescription: initialDescription,
                      // );
                    },
                  ),
                  // GoRoute(
                  //   path: AppRoutes.recipientPage,
                  //   parentNavigatorKey: _rootNavigator,
                  //   builder: (context, state) => const RecipientPage(),
                  // ),
                  // GoRoute(
                  //   path: AppRoutes.recipientForm,
                  //   parentNavigatorKey: _rootNavigator,
                  //   builder: (context, state) => const RecipientFormPage(),
                  // ),
                ],
              ),
            ],
          ),
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
        ],
      ),
    ],
  );
}
