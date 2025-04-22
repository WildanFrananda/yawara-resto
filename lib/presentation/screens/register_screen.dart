import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  final AuthViewModel authViewModel;

  const RegisterScreen({super.key, required this.authViewModel});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AuthViewModel>('authViewModel', authViewModel));
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  late final AuthViewModel auth;

  @override
  void initState() {
    super.initState();
    auth = widget.authViewModel;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListenableBuilder(
          listenable: auth,
          builder: (final BuildContext context, final Widget? child) {
            return Column(
              children: [
                TextField(
                  controller: _nameCtl,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _emailCtl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _passCtl,
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
                          await auth.register(
                            _nameCtl.text,
                            _emailCtl.text,
                            _passCtl.text,
                          );
                          scaffold.showSnackBar(
                            const SnackBar(content: Text('Verify your email')),
                          );
                          await router.setNewRoutePath(const AppRouteLogin());
                        } on FormatException catch (e) {
                          scaffold.showSnackBar(SnackBar(content: Text(e.message)));
                        }
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
}
