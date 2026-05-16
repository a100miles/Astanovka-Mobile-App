import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen Dummy'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to login screen
                context.push('/login');
              },
              child: const Text('Go to Login/Sign-up'),
            ),
            
            // TODO (Teammate 1): 
            // 1. Connect this screen to Firebase Auth via Riverpod to check if user is logged in.
            // 2. If logged in, show User Info (Email/Name) and a "Sign Out" button.
            // 3. If NOT logged in, show the "Go to Login" button.
            // 4. Fetch and display the user's "Favorite Places" here using Drift (SQLite) queries.
          ],
        ),
      ),
    );
  }
}