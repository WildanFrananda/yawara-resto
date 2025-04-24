import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  final AuthViewModel authViewModel;

  const LoginScreen({super.key, required this.authViewModel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AuthViewModel>('authViewModel', authViewModel));
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthViewModel auth;

  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth = widget.authViewModel;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListenableBuilder(
          listenable: auth,
          builder: (final BuildContext context, final Widget? child) {
            return Column(
              children: [
                TextField(
                  controller: _emailCtl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _passwordCtl,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 16),
                auth.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () async {
                        final scaffold = ScaffoldMessenger.of(context);
                        final router =
                            Router.of(context).routerDelegate as AppRouterDelegate;

                        try {
                          await auth.login(_emailCtl.text, _passwordCtl.text);
                          await router.setNewRoutePath(const AppRouteRegister());
                        } on FormatException catch (e) {
                          scaffold.showSnackBar(SnackBar(content: Text(e.message)));
                        }
                      },
                      child: const Text('Login'),
                    ),
                TextButton(
                  onPressed: () async {
                    final router = Router.of(context).routerDelegate as AppRouterDelegate;

                    await router.setNewRoutePath(const AppRouteRegister());
                  },
                  child: const Text('Register'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AuthViewModel>('auth', auth));
  }

  @override
  void dispose() {
    _emailCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }
}
