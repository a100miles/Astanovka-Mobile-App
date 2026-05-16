import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when tapping an already active tab is to pop to the top of the stack
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allows the body to scroll underneath the navigation bar
      body: navigationShell,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            color: Colors.white.withValues(alpha: 0.75),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.grey.shade400,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: navigationShell.currentIndex,
                  onTap: (index) => _onTap(context, index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.map_outlined, size: 28),
                      activeIcon: Icon(Icons.map, size: 28),
                      label: 'Places',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline, size: 28),
                      activeIcon: Icon(Icons.person, size: 28),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
