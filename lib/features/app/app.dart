import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/bloc/payment_cards_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SapsanoApp extends StatefulWidget {
  const SapsanoApp({super.key});

  @override
  State<SapsanoApp> createState() => _SapsanoAppState();
}

class _SapsanoAppState extends State<SapsanoApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    final authorization = context.read<AuthorizationBloc>();

    _router = createRouter(
      authorization,
      (authorization.state as InitialAuthorizationState).initialPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthorizationBloc, AuthorizationState>(
          listener: (BuildContext context, AuthorizationState state) {
            if (state is AuthorizedState &&
                state.sessionInfo.user.role == UserRole.user) {
              context.read<PaymentCardsBloc>().add(PaymentCardsLoadEvent());
            }
          },
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: 'Sapsano',
            theme: ThemeData(
              useMaterial3: true,
              buttonTheme: ButtonThemeData(buttonColor: BeColors.primary),
              primaryColor: BeColors.primary,
              colorScheme: ColorScheme.of(
                context,
              ).copyWith(primary: BeColors.primary),
              scaffoldBackgroundColor: Colors.white,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(color: BeColors.primary),
                ),
              ),
              textTheme: GoogleFonts.montserratTextTheme(
                TextTheme.of(context),
              ),
              appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: GoogleFonts.montserrat(
                  fontWeight: .w600,
                  fontSize: 17,
                  color: BeColors.surface5,
                ),
                backgroundColor: BeColors.white,
              ),
            ),
            routerConfig: _router,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.supportedLocales,
            locale: locale,
          );
        },
      ),
    );
  }
}
