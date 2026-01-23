import 'package:flutter/material.dart';
import 'package:fly_cargo/core/router/go_router_refresh_stream.dart';
import 'package:fly_cargo/core/router/main_scaffold_shell.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_confirm_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_name_screen.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_page.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/ui_kit_page.dart';
import 'package:fly_cargo/features/onboarding/onboarding_screen.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_page.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_orders_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/contacts_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/legal_entities_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/notifications_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/privacy_policy_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/profile_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/settings_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/terms_of_service_page.dart';
import 'package:fly_cargo/features/profile/presentation/pages/transportation_rules_page.dart';
import 'package:go_router/go_router.dart';

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

        return null;
      }

      if (authorizationState is AuthorizationOtpRequestingState) {
        return null;
      }

      if (authorizationState is AuthorizationOtpRequestedState) {
        return null;
      }

      if (authorizationState is AuthorizationOtpRequestFailureState) {
        return null;
      }

      if (authorizationState is AuthorizationOtpConfirmingState) {
        return null;
      }

      if (authorizationState is AuthorizationOtpConfirmedState) {
        return null;
      }

      if (authorizationState is AuthorizationOtpConfirmFailureState) {
        return null;
      }

      if (authorizationState is AuthorizationLoadingState) {
        return null;
      }

      if (authorizationState is AuthorizedState) {
        return null;
      }

      return AuthorizationRequestScreen.location();
    },
    routes: [
      OnboardingScreen.route(),
      AuthorizationRequestScreen.route(),
      AuthorizationConfirmScreen.route(),
      AuthorizationNameScreen.route(),
      UiKitPage.route(),

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

      ClientOrderPage.route(),
      ProfilePage.route(),
      ContactsPage.route(),
      NotificationsPage.route(),
      PrivacyPolicyPage.route(),
      TermsOfServicePage.route(),
      LegalEntitiesPage.route(),
      TransportationRulesPage.route(),
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
