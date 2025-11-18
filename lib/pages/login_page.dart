// lib/pages/login_page.dart

import 'package:flutter/material.dart';
import '../routes.dart';
import '../services/storage_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    final username = _usernameCtrl.text.trim();
    final password = _passCtrl.text;

    // validasi akun tersimpan di SharedPreferences
    final ok = await StorageService.validateLogin(username, password);

    // delay kecil agar UX tidak terasa mendadak
    await Future.delayed(const Duration(milliseconds: 400));

    if (ok) {
      await StorageService.setCurrentUser(username);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Gagal'),
          content: const Text('Username atau password salah.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
          ],
        ),
      );
    }

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 80),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _usernameCtrl,
                            decoration: const InputDecoration(labelText: 'Username'),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Isi username' : null,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _passCtrl,
                            decoration: const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (v) => (v == null || v.isEmpty) ? 'Isi password' : null,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _loading ? null : _login,
                              child: _loading
                                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                                  : const Text('Masuk'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
                                child: const Text('Daftar akun baru'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Atau masuk sebagai tamu untuk melihat demo aplikasi.'),
                TextButton(
                  onPressed: () async {
                    // Quick guest account (create if needed) then login
                    const guestUser = 'guest';
                    const guestPass = 'guest1234';
                    await StorageService.saveAccount(guestUser, guestPass);
                    await StorageService.setCurrentUser(guestUser);
                    if (!mounted) return;
                    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                  },
                  child: const Text('Masuk sebagai tamu'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
