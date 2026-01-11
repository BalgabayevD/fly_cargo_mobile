import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/features/auth/presentation/router/auth_router.dart';
import 'package:fly_cargo/shared/ui/button.dart';
import 'package:fly_cargo/shared/ui/colors.dart';
import 'package:fly_cargo/shared/ui/space.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
                          text: 'Авторизоваться',
                          backgroundColor: BeColors.white.withAlpha(30),
                          textColor: BeColors.white,
                          color: .gray,
                          onPressed: () =>
                              AuthRouter.navigateToPhoneInput(context),
                        ),

                        BeSpace(size: .xl),

                        BeButton(
                          text: 'Продолжить',
                          backgroundColor: BeColors.white,
                          color: .gray,
                          onPressed: () =>
                              AuthRouter.navigateToPhoneInput(context),
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
