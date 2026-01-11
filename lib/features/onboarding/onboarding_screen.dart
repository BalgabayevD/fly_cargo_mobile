import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/auth/presentation/pages/authorization_request_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  static String path = '/onboarding';

  const OnboardingScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeColors.primary,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Image.asset(
                    'assets/images/onboarding_grid.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          'Sapsano',
                          textAlign: .center,
                          style: GoogleFonts.montserrat(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: BeColors.white,
                          ),
                        ),

                        Spacer(),

                        BeButton(
                          text: 'Пропустить',
                          backgroundColor: BeColors.white.withAlpha(30),
                          textColor: BeColors.white,
                          color: .gray,
                          onPressed: () {},
                        ),

                        BeSpace(size: .xl),

                        BeButton(
                          text: 'Авторизоваться',
                          backgroundColor: BeColors.white,
                          color: .gray,
                          onPressed: () => context.push(
                            AuthorizationRequestScreen.location(),
                          ),
                        ),

                        BeSpace(size: .xxxl),

                        AgreementText(),

                        BeSpace(size: .xxl),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AgreementText extends StatelessWidget {
  const AgreementText({super.key});

  TextStyle get _underline => TextStyle(decoration: .underline);
  TextStyle get _textStyle => GoogleFonts.montserrat(
    color: BeColors.white,
    fontSize: 14,
    fontWeight: .w600,
  );

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: .center,
      text: TextSpan(
        style: _textStyle,
        children: [
          const TextSpan(text: 'Продолжая, вы '),
          TextSpan(
            text: 'соглашаетесь с политикой использования',
            style: _underline,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Политика использования');
              },
          ),
          const TextSpan(text: ' и '),
          TextSpan(
            text: 'условиями оферты',
            style: _underline,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Условия оферты');
              },
          ),
        ],
      ),
    );
  }
}
