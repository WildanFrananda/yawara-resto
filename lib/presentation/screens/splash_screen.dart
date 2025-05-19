import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/presentation/widgets/splash/next_button.dart';

class SplashScreen extends StatefulWidget {
  final void Function(AppRoute) onFinished;

  const SplashScreen({super.key, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(AppRoute)>.has('onFinished', onFinished),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  // Controllers for animations
  late AnimationController _logoAnimationController;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoScaleAnimation;
  bool _showButton = false;
  bool _showTexts = false;

  @override
  void initState() {
    super.initState();

    // Initialize logo animation controller
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Create fade animation for logo
    _logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0, 0.65, curve: Curves.easeInOut),
      ),
    );

    // Create scale animation for logo
    _logoScaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0, 0.65, curve: Curves.easeInOut),
      ),
    );

    // Start the splash screen sequence
    _startSplashScreenSequence();
  }

  void _startSplashScreenSequence() {
    // Start logo animation
    _logoAnimationController.forward();

    // Show welcome text after logo animation
    Timer(const Duration(milliseconds: 1800), () {
      setState(() {
        _showTexts = true;
      });
    });

    // Show button after texts
    Timer(const Duration(milliseconds: 3300), () {
      setState(() {
        _showButton = true;
      });
    });

    // Auto navigate after a certain time if the user doesn't press the button
    // Uncomment this if you want auto-navigation after a delay
    Timer(const Duration(seconds: 6), () {
      if (mounted) {
        widget.onFinished(AppRoute.login());
      }
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              const Spacer(),
              // Logo Animation
              AnimatedBuilder(
                animation: _logoAnimationController,
                builder: (final context, final child) {
                  return Opacity(
                    opacity: _logoFadeAnimation.value,
                    child: Transform.scale(
                      scale: _logoScaleAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Image.asset('assets/logo.png', width: 100, height: 100),
              ),
              const Spacer(),
              // Welcome Text Animation
              if (_showTexts)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Welcome to Yawara Resto',
                              speed: const Duration(milliseconds: 120),
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'Order the best meals in Lagos and\nhave them delivered to your doorstep\nin little or no time. Doesn\'t that sound\ndelicious???',
                              textAlign: TextAlign.center,
                              duration: const Duration(milliseconds: 3000),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.1,
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              const Spacer(),
              // Button Animation
              if (_showButton)
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  builder: (final context, final value, final child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: NextButton(
                    onPressed: () {
                      // Navigate to login screen using Navigator 2.0
                      widget.onFinished(AppRoute.login());
                    },
                  ),
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
