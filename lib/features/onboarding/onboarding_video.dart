import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/auth/presentation/router/auth_router.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/onboarding.mp4')
      ..setLooping(true)
      ..setVolume(0.0)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _VideoBackground(
            controller: _controller,
            isInitialized: _isInitialized,
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.surface5.withValues(alpha: 0.35),
                    AppColors.surface5.withValues(alpha: 0.45),
                    AppColors.surface5.withValues(alpha: 0.35),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 18.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () => context.go(AppRoutes.home),
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.surface5.withValues(
                              alpha: 0.4,
                            ),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Пропустить',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(flex: 1),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sapsano',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Доставляем\nсамое ценное',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(flex: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              AuthRouter.navigateToPhoneInput(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                            ),
                            child: Text(
                              'Авторизоваться',
                              style: TextStyle(
                                color: AppColors.surface5,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        Center(
                          child: Text(
                            'Продолжая, вы соглашаетесь с политикой использования и условиями оферты',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoBackground extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isInitialized;

  const _VideoBackground({
    required this.controller,
    required this.isInitialized,
  });

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return SizedBox.expand(
        child: ColoredBox(color: AppColors.surface5),
      );
    }

    final size = controller.value.size;
    if (size.width == 0 || size.height == 0) {
      return SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: 1,
            height: 1,
            child: VideoPlayer(controller),
          ),
        ),
      );
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
