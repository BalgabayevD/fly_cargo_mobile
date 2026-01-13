import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/pages/create_order_page.dart';
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
    _router = createRouter(
      getIt<AuthorizationBloc>(),
      CreateOrderScreen.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
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
    );
  }
}
