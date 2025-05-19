import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({super.key});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.forward();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        }
      });
    } else {
      await HapticFeedback.mediumImpact();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (final context, final scrollController) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (final context, final child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withAlpha((0.3 * 255).round()),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: child,
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drag Handle
                        Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ).animate().slideY(
                          begin: 0.3,
                          end: 0,
                          curve: Curves.easeOutQuint,
                          duration: 500.ms,
                        ),

                        const SizedBox(height: 30),

                        const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            .animate()
                            .fade(duration: 500.ms)
                            .slideY(
                              begin: 0.5,
                              end: 0,
                              curve: Curves.easeOutQuint,
                              duration: 500.ms,
                            ),
                        const SizedBox(height: 30),
                        TextFormField(
                              controller: _nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white60,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(25),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              validator: (final value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            )
                            .animate(delay: 100.ms)
                            .fade(duration: 500.ms)
                            .slideX(
                              begin: 0.3,
                              end: 0,
                              curve: Curves.easeOutQuint,
                              duration: 500.ms,
                            ),

                        const SizedBox(height: 15),

                        // Email
                        TextFormField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white60,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(25),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              validator: (final value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!EmailValidator.validate(value.trim())) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            )
                            .animate(delay: 200.ms)
                            .fade(duration: 500.ms)
                            .slideX(
                              begin: 0.3,
                              end: 0,
                              curve: Curves.easeOutQuint,
                              duration: 500.ms,
                            ),

                        const SizedBox(height: 15),

                        // Password
                        TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(color: Colors.white),
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white60),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white60,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(25),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              validator: (final value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            )
                            .animate(delay: 300.ms)
                            .fade(duration: 500.ms)
                            .slideX(
                              begin: 0.3,
                              end: 0,
                              curve: Curves.easeOutQuint,
                              duration: 500.ms,
                            ),

                        const SizedBox(height: 15),

                        // Confirm Password
                        TextFormField(
                              controller: _confirmPasswordController,
                              style: const TextStyle(color: Colors.white),
                              obscureText: !_isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.white60,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white60,
                                  ),
                                  onPressed: _toggleConfirmPasswordVisibility,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(25),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              validator: (final value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            )
                            .animate(delay: 400.ms)
                            .fade(duration: 500.ms)
                            .slideX(
                              begin: 0.3,
                              end: 0,
                              curve: Curves.easeOutQuint,
                              duration: 500.ms,
                            ),

                        const SizedBox(height: 30),

                        // Sign Up Button
                        SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ListenableBuilder(
                                listenable: viewModel,
                                builder: (
                                  final BuildContext context,
                                  final Widget? child,
                                ) {
                                  return ElevatedButton(
                                    onPressed:
                                        viewModel.loading
                                            ? null
                                            : () async {
                                              if (_formKey.currentState!.validate()) {
                                                setState(() {
                                                  _isLoading = true;
                                                });

                                                final scaffold = ScaffoldMessenger.of(
                                                  context,
                                                );

                                                try {
                                                  await viewModel.register(
                                                    _nameController.text,
                                                    _emailController.text,
                                                    _passwordController.text,
                                                  );
                                                  scaffold.showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Account created successfully!',
                                                      ),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                } on FormatException catch (e) {
                                                  scaffold.showSnackBar(
                                                    SnackBar(content: Text(e.message)),
                                                  );
                                                } finally {
                                                  if (mounted) {
                                                    setState(() {
                                                      _isLoading = false;
                                                    });
                                                  }
                                                }
                                              } else {
                                                await HapticFeedback.mediumImpact();
                                              }
                                            },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF3E3653),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                    ),
                                    child:
                                        viewModel.loading
                                            ? const CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            )
                                            : AnimatedTextKit(
                                              animatedTexts: [
                                                WavyAnimatedText(
                                                  'Never Hungry Again!',
                                                  textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  speed: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                ),
                                              ],
                                              isRepeatingAnimation: false,
                                              totalRepeatCount: 1,
                                            ),
                                  );
                                },
                              ),
                            )
                            .animate(delay: 500.ms)
                            .fade(duration: 500.ms)
                            .scale(delay: 500.ms, duration: 300.ms),
                        const SizedBox(height: 20),
                        // Or Sign Up with
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey[700], thickness: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'or Sign Up with',
                                style: TextStyle(color: Colors.grey[500], fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.grey[700], thickness: 1),
                            ),
                          ],
                        ).animate(delay: 600.ms).fade(duration: 500.ms),
                        const SizedBox(height: 20),
                        // Social Media Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Facebook Button
                            const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.blue,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    onPressed: HapticFeedback.lightImpact,
                                  ),
                                )
                                .animate(delay: 700.ms)
                                .fadeIn(duration: 500.ms)
                                .shimmer(duration: 1200.ms, curve: Curves.easeInOut),
                            const SizedBox(width: 20),
                            // Google Button
                            const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red,
                                  child: IconButton(
                                    icon: Icon(Icons.mail, color: Colors.white, size: 28),
                                    onPressed: HapticFeedback.lightImpact,
                                  ),
                                )
                                .animate(delay: 800.ms)
                                .fadeIn(duration: 500.ms)
                                .shimmer(duration: 1200.ms, curve: Curves.easeInOut),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

// @override
// Widget build(final BuildContext context) {
//   final viewModel = context.watch<AuthViewModel>();

//   return Scaffold(
//     appBar: AppBar(title: const Text('Register')),
//     body: Padding(
//       padding: const EdgeInsets.all(16),
//       child: ListenableBuilder(
//         listenable: viewModel,
//         builder: (final BuildContext context, final Widget? child) {
//           return Column(
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 16),
//               viewModel.loading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                     onPressed: () async {
//                       final scaffold = ScaffoldMessenger.of(context);
//                       final router =
//                           Router.of(context).routerDelegate as AppRouterDelegate;

//                       try {
//                         await viewModel.register(
//                           _nameController.text,
//                           _emailController.text,
//                           _passwordController.text,
//                         );
//                         scaffold.showSnackBar(
//                           const SnackBar(content: Text('Verify your email')),
//                         );
//                         await router.setNewRoutePath(const AppRouteLogin());
//                       } on FormatException catch (e) {
//                         scaffold.showSnackBar(SnackBar(content: Text(e.message)));
//                       }
//                     },
//                     child: const Text('Register'),
//                   ),
//             ],
//           );
//         },
//       ),
//     ),
//   );
// }
