// ignore_for_file: discarded_futures

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';

class ProfileScreen extends StatelessWidget {
  final AuthViewModel authViewModel;

  const ProfileScreen({super.key, required this.authViewModel});

  @override
  Widget build(final BuildContext context) {
    final auth = authViewModel;
    final user = auth.user;

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

    final nameCtl = TextEditingController(text: user.name);
    final emailCtl = TextEditingController(text: user.email);
    final phoneCtl = TextEditingController(text: user.phone ?? '');
    final addressCtl = TextEditingController(text: user.address ?? '');

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListenableBuilder(
          listenable: auth,
          builder: (final BuildContext context, final Widget? child) {
            return Column(
              children: [
                if (user.avatarUrl != null) Image.network(user.avatarUrl!),
                TextField(
                  controller: nameCtl,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailCtl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneCtl,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: addressCtl,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                const SizedBox(height: 16),
                auth.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () async {
                        final scaffold = ScaffoldMessenger.of(context);
                        try {
                          await auth.updateProfile(
                            name: nameCtl.text,
                            email: emailCtl.text,
                            phone: phoneCtl.text,
                            address: addressCtl.text,
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
    properties.add(DiagnosticsProperty<AuthViewModel>('authViewModel', authViewModel));
  }
}
