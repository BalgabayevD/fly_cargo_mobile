import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/courier_scaffold_shell.dart';
import 'package:fly_cargo/core/router/go_router_refresh_stream.dart';
import 'package:fly_cargo/core/router/main_scaffold_shell.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_list_screen.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_order_detail_screen.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_orders_screen.dart';
import 'package:fly_cargo/features/accumulator/presentation/pages/accumulator_scan_screen.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_entity.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_confirm_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_name_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:fly_cargo/features/courier_identify_order/presentation/screen/courier_order_identify_screen.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_screen.dart';
import 'package:fly_cargo/features/home/presentation/screen/courier_home_screen.dart';
import 'package:fly_cargo/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/cancel_reason_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_orders_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_accept_order_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_open_orders_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_order_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_scan_screen.dart';
import 'package:fly_cargo/features/payments/presentation/pages/add_card_page.dart';
import 'package:fly_cargo/features/payments/presentation/pages/payment_cards_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/contacts_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/courier_settings_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/legal_entities_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/notifications_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/privacy_policy_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/profile_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/settings_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/terms_of_service_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/transportation_rules_page.dart';
import 'package:fly_cargo/features/submit_order/presentation/pages/courier_submit_order_screen.dart';
import 'package:fly_cargo/features/ui_kit/presentation/screen/ui_kit_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/orders/presentation/pages/courier_orders_screen.dart';

class AppRoutes {
  static const onboarding = '/';
  static const login = '/login';
  static const verify = '/verify';

  // Main Shell
  static const home = '/home';

  // Home Sub-pages
  static const descriptionForm = 'description-form';
  static const recipientForm = 'recipient-form'; // Or recipient page?
  static const recipientPage = 'recipient';

  // Settings Sub-pages
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

final GlobalKey<NavigatorState> courierNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> courierOrdersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> courierOpenOrdersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> courierSettingsNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter createRouter(
  FirebaseAnalyticsObserver analyticsObserver,
  AuthorizationBloc authorizationBloc,
  String initialLocation,
) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: initialLocation,
    observers: [analyticsObserver],
    refreshListenable: GoRouterRefreshStream(authorizationBloc.stream),
    redirect: (context, state) {
      final authorizationState = authorizationBloc.state;

      final isSkipPath = [
        AuthorizationRequestScreen.path,
        AuthorizationConfirmScreen.path,
        AuthorizationNameScreen.path,
      ].contains(state.fullPath);

      if (isSkipPath) {
        return null;
      }

      if (authorizationState is UnauthorizedState) {
        return OnboardingScreen.location();
      }

      if (authorizationState is AuthorizedState) {
        final isOnboardingPath = state.fullPath == OnboardingScreen.path;

        if (isOnboardingPath) {
          // Перенаправляем авторизованного пользователя с onboarding на домашний экран
          if (authorizationState.sessionInfo.user.role == UserRole.user) {
            return CreateOrderScreen.location();
          } else if (authorizationState.sessionInfo.user.role == UserRole.courier) {
            return CourierHomeScreen.location();
          }
        }
      }

      return null;
    },
    routes: [
      OnboardingScreen.route(),
      AuthorizationRequestScreen.route(),
      AuthorizationConfirmScreen.route(),
      AuthorizationNameScreen.route(),
      UiKitScreen.route(),

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
                      // final initialDescription = state.extra as String?;
                      return Text('1');
                      // return DescriptionFormPage(
                      //   initialDescription: initialDescription,
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _ordersNavigatorKey,
            routes: [
              ClientOrdersPage.route(routes: []),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              SettingsPage.route(),
            ],
          ),
        ],
      ),

      ClientScaffoldShell.route(
        branches: [
          StatefulShellBranch(
            navigatorKey: courierNavigatorKey,
            routes: [
              CourierHomeScreen.route(routes: []),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: courierOrdersNavigatorKey,
            routes: [
              CourierOrdersPage.route(),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: courierOpenOrdersNavigatorKey,
            routes: [
              CourierOpenOrdersScreen.route(),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: courierSettingsNavigatorKey,
            routes: [
              CourierSettingsPage.route(),
            ],
          ),
        ],
      ),

      ClientOrderPage.route(),
      CancelReasonPage.route(),
      ProfilePage.route(),
      ContactsPage.route(),
      NotificationsPage.route(),
      PrivacyPolicyPage.route(),
      TermsOfServicePage.route(),
      LegalEntitiesPage.route(),
      TransportationRulesPage.route(),
      AddCardPage.route(),
      PaymentCardsPage.route(),
      CourierOrdersScanScreen.route(),
      AccumulatorScanScreen.route(),
      AccumulatorListScreen.route(),
      AccumulatorOrdersScreen.route(),
      AccumulatorOrderDetailScreen.route(),
      CourierAcceptOrdersPage.route(),
      CourierOrderScreen.route(),
      CourierSubmitOrdersScreen.route(),
      CourierOrderIdentifyScreen.route(),
    ],
  );
}

class HomeNavigatorBranch {
  const HomeNavigatorBranch();

  static StatefulShellBranch route({
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    return StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: [
        CreateOrderScreen.route(
          routes: routes,
        ),
      ],
    );
  }
}
