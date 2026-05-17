import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/places/presentation/main_layout.dart';
import '../../features/places/presentation/main_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/login_screen.dart';
import '../../features/profile/data/auth_repository.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    initialLocation: '/places',
    redirect: (context, state) {
      final isAtLogin = state.matchedLocation == '/login';

      // While Firebase/Auth is initializing, don't redirect.
      if (authState.isLoading) return null;

      final user = authState.asData?.value;
      if (user == null) {
        return isAtLogin ? null : '/login';
      }

      // If user is already logged in, keep them out of the login page.
      if (isAtLogin) return '/profile';

      return null;
    },
    routes: [
      // The ShellRoute handles the Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // This returns the Scaffold with the BottomNavigationBar
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Main Places List
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/places',
                builder: (context, state) => const MainScreen(),
                // TODO for Teammate: Add sub-route for place details here later
                // e.g., GoRoute(path: ':id', builder: ...)
              ),
            ],
          ),
          // Branch 1: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Login is OUTSIDE the shell because it shouldn't have a bottom nav bar
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});
