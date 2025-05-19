import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/presentation/screens/register_screen.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  // Animation controllers and animations
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    // Start animation after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  Future<void> _showSignUpBottomSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (final context) => const SignUpBottomSheet(),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (final BuildContext context, final Widget? child) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      children: [
                        const SizedBox(height: 24),
                        // Logo Animation
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (final context, final child) {
                            return Transform.rotate(
                              angle: _rotateAnimation.value,
                              child: Opacity(
                                opacity: _fadeInAnimation.value,
                                child: Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('assets/logo.png'),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        const SizedBox(height: 60),
                        // Email field
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeInAnimation,
                            child: TextField(
                              controller: _emailCtl,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: const TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.black,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Password field
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeInAnimation,
                            child: TextField(
                              controller: _passwordCtl,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.black,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Login Button
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: FadeTransition(
                            opacity: _fadeInAnimation,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final scaffold = ScaffoldMessenger.of(context);
                                  final router =
                                      Router.of(context).routerDelegate
                                          as AppRouterDelegate;
                                  try {
                                    await viewModel.login(
                                      _emailCtl.text,
                                      _passwordCtl.text,
                                    );
                                    router.setRoute(const AppRouteHome());
                                  } on FormatException catch (e) {
                                    scaffold.showSnackBar(
                                      SnackBar(content: Text(e.message)),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF362E54),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child:
                                    viewModel.loading
                                        ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                        : const Text(
                                          'Eat Away!',
                                          style: TextStyle(fontSize: 16),
                                        ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Social Media Icons
                        FadeTransition(
                          opacity: _fadeInAnimation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialButton(
                                icon: Icons.facebook,
                                color: Colors.blue,
                                onPressed: () {},
                              ),
                              const SizedBox(width: 24),
                              _buildSocialButton(
                                icon: Icons.email,
                                color: Colors.red,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: FadeTransition(
          opacity: _fadeInAnimation,
          child: GestureDetector(
            onTap: _showSignUpBottomSheet,
            onVerticalDragEnd: (final details) async {
              if (details.primaryVelocity! < 0) {
                await _showSignUpBottomSheet();
                await HapticFeedback.lightImpact();
              }
            },
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF362E54),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Sign Up text
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Swipe indicator
                  Positioned(
                    top: 8,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white.withAlpha(180),
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required final IconData icon,
    required final Color color,
    required final VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }
}
