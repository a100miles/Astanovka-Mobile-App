import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegisterMode = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
        data: (_) {
          if (previous is AsyncLoading) {
            context.pop();
          }
        },
      );
    });

    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegisterMode ? 'Create Account' : 'Sign In'),
        // Back button is automatically added by go_router since we used context.push()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isRegisterMode
                    ? 'Create an account to save favorite places.'
                    : 'Sign in to see your profile and favorites.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final email = value?.trim() ?? '';
                  if (email.isEmpty) return 'Email is required';
                  final looksLikeEmail = RegExp(r'^.+@.+\..+$').hasMatch(email);
                  if (!looksLikeEmail) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                enabled: !isLoading,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: isLoading
                        ? null
                        : () => setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) {
                  final password = value ?? '';
                  if (password.isEmpty) return 'Password is required';
                  if (password.length < 6) return 'Minimum 6 characters';
                  return null;
                },
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: isLoading ? null : _submit,
                child: Text(isLoading
                    ? 'Please wait...'
                    : (_isRegisterMode ? 'Create account' : 'Sign in')),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: isLoading
                    ? null
                    : () => setState(() => _isRegisterMode = !_isRegisterMode),
                child: Text(_isRegisterMode
                    ? 'Already have an account? Sign in'
                    : 'No account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (_isRegisterMode) {
      await ref
          .read(authControllerProvider.notifier)
          .register(email: email, password: password);
    } else {
      await ref
          .read(authControllerProvider.notifier)
          .signIn(email: email, password: password);
    }
  }
}
