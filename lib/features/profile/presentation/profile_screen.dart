import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/database_providers.dart';
import '../../../core/widgets/language_switcher.dart';
import '../../../l10n/app_localizations.dart';
import '../data/auth_repository.dart';
import 'controllers/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTab),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: LanguageSwitcher(),
          ),
        ],
      ),
      body: authState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.authError,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(authStateProvider),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (user) {
          if (user == null) {
            return _LoggedOutView(
              onLogin: () => context.push('/login'),
            );
          }

          return _LoggedInView(user: user);
        },
      ),
    );
  }
}

class _LoggedOutView extends StatelessWidget {
  const _LoggedOutView({required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.notSignedIn, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onLogin,
              child: Text(l10n.goToLogin),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoggedInView extends ConsumerWidget {
  const _LoggedInView({required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final email = user.email ?? l10n.noEmail;
    final uid = user.uid;

    final favorites = ref.watch(favoritePlacesProvider(uid));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.signedInAs,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(email, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () async {
            await ref.read(authControllerProvider.notifier).signOut();
          },
          icon: const Icon(Icons.logout),
          label: Text(l10n.signOut),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.favoritePlaces,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        favorites.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) => Text(l10n.favoritesError(error.toString())),
          data: (items) {
            if (items.isEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(l10n.noFavorites),
              );
            }

            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  for (final fav in items)
                    ListTile(
                      title: Text(fav.name),
                      subtitle:
                          fav.address == null ? null : Text(fav.address!),
                      onTap: () => context.push('/places/${fav.placeId}'),
                      trailing: IconButton(
                        tooltip: l10n.remove,
                        onPressed: () async {
                          await ref.read(appDatabaseProvider).removeFavorite(
                                userIdValue: uid,
                                placeIdValue: fav.placeId,
                              );
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
