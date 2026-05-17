import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/places/presentation/main_layout.dart';
import '../../features/places/presentation/main_screen.dart';
import '../../features/places/presentation/place_info_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/places',
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
                routes: [
                  // Sub-route: Place Info Screen
                  GoRoute(
                    path: 'info', // Full path will be '/places/info'
                    builder: (context, state) {
                      final args = state.extra as Map<String, dynamic>;
                      return PlaceInfoScreen(
                        placeName: args['name'],
                        placeDescription: args['description'],
                        placeImageUrl: args['imageUrl'],
                      );
                    },
                  ),
                ],
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