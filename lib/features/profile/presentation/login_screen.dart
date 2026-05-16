import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        // Back button is automatically added by go_router since we used context.push()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login Page Dummy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            
            // TODO (Teammate 1 or 2):
            // 1. Build out the UI forms for Email and Password using TextFormField.
            // 2. Implement form validation.
            // 3. Create a Riverpod AuthController to handle the Firebase Auth login/register methods.
            // 4. On successful login, use `context.pop()` to return the user to the Profile screen.
            
            ElevatedButton(
              onPressed: () {
                // Dummy action to return to previous screen
                context.pop();
              },
              child: const Text('Simulate Login & Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}