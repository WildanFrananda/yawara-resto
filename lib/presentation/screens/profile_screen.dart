// ignore_for_file: discarded_futures

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  final AuthViewModel authViewModel;

  const ProfileScreen({super.key, required this.authViewModel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AuthViewModel>('authViewModel', authViewModel));
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final AuthViewModel auth;
  late final User? user;

  late final TextEditingController _nameCtl;
  late final TextEditingController _emailCtl;
  late final TextEditingController _phoneCtl;
  late final TextEditingController _addressCtl;

  @override
  void initState() {
    super.initState();
    auth = widget.authViewModel;
    user = auth.user;

    _nameCtl = TextEditingController(text: user?.name ?? '');
    _emailCtl = TextEditingController(text: user?.email ?? '');
    _phoneCtl = TextEditingController(text: user?.phone ?? '');
    _addressCtl = TextEditingController(text: user?.address ?? '');
  }

  @override
  Widget build(final BuildContext context) {
    if (user == null) {
      return FutureBuilder(
        future: auth.fetchProfile(),
        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            return const SizedBox.shrink();
          }

          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      );
    }

    return Scaffold(
      appBar: const RestoAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListenableBuilder(
          listenable: auth,
          builder: (final BuildContext context, final Widget? child) {
            return Column(
              children: [
                if (user?.avatarUrl != null) Image.network(user!.avatarUrl!),
                ...[
                  {'label': 'Name', 'controller': _nameCtl},
                  {'label': 'Email', 'controller': _emailCtl},
                  {'label': 'Phone', 'controller': _phoneCtl},
                  {'label': 'Address', 'controller': _addressCtl},
                ].map((final field) {
                  return TextField(
                    controller: field['controller'] as TextEditingController,
                    decoration: InputDecoration(labelText: field['label'] as String),
                  );
                }),
                const SizedBox(height: 16),
                auth.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () async {
                        final scaffold = ScaffoldMessenger.of(context);

                        try {
                          await auth.updateProfile(
                            name: _nameCtl.text,
                            email: _emailCtl.text,
                            phone: _phoneCtl.text,
                            address: _addressCtl.text,
                          );
                          scaffold.showSnackBar(
                            const SnackBar(content: Text('Profile updated successfully')),
                          );
                        } on FormatException catch (e) {
                          scaffold.showSnackBar(SnackBar(content: Text(e.message)));
                        }
                      },
                      child: const Text('Update Profile'),
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
    properties
      ..add(DiagnosticsProperty<AuthViewModel>('auth', auth))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _emailCtl.dispose();
    _phoneCtl.dispose();
    _addressCtl.dispose();
    super.dispose();
  }
}
