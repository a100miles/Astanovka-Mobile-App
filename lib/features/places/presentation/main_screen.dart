import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/database_providers.dart';
import '../../../core/widgets/language_switcher.dart';
import '../../profile/data/auth_repository.dart';
import '../providers/place_provider.dart';
import '../../../l10n/app_localizations.dart';
import 'controllers/favorites_controller.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final List<_PlaceCategory> categories = const [
    _PlaceCategory.all(),
    _PlaceCategory.restaurants(),
    _PlaceCategory.parks(),
    _PlaceCategory.museums(),
  ];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final softRed = Colors.red.shade400;
    final placesAsync = ref.watch(placesProvider);
    final user = ref.watch(authStateProvider).asData?.value;
    final selectedCategory = categories[selectedCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Astanovka',
        //   style: GoogleFonts.getFont(
        //     'Badeen Display',
        //     fontWeight: FontWeight.bold,
        //     fontSize: 28,
        //     color: Colors.green,
        //   ),
        // ),
        centerTitle: false,
        actions: [
          // Language Selector
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: const LanguageSwitcher(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Horizontal Categories
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = selectedCategoryIndex == index;
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? softRed : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? softRed : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          category.icon,
                          size: 18,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          category.label(l10n),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              l10n.interestingPlaces,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: placesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Places error: $error')),
              data: (places) {
                final filtered = selectedCategory.key == null
                    ? places
                    : places.where((p) => p.category == selectedCategory.key).toList();
                return ListView.separated(
                  // Add padding at the bottom so the last item isn't hidden by the glass nav bar
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 100.0,
                  ),
                  itemCount: filtered.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final place = filtered[index];
                    final isFavoriteAsync = user == null
                        ? null
                        : ref.watch(
                            isFavoriteProvider(
                              FavoriteLookupKey(
                                userId: user.uid,
                                placeId: place.id.toString(),
                              ),
                            ),
                          );
                    final busy = ref.watch(favoritesControllerProvider).contains(place.id);

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () => context.push('/places/${place.id}'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Immersive Image
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      width: double.infinity,
                                      child: Image.network(
                                        place.imageUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            Container(
                                          color: Colors.green.shade50,
                                          child: const Icon(
                                            Icons.landscape,
                                            color: Colors.green,
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      right: 16,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          tooltip: 'Favorite',
                                          onPressed: busy
                                              ? null
                                              : () async {
                                            if (user == null) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(l10n.signInToAddFavorites),
                                                ),
                                              );
                                              context.push('/login');
                                              return;
                                            }

                                            final isFav =
                                                isFavoriteAsync?.asData?.value ??
                                                    false;
                                            await ref
                                                .read(favoritesControllerProvider.notifier)
                                                .toggle(
                                                  userId: user.uid,
                                                  placeId: place.id,
                                                  isFavorite: isFav,
                                                  name: place.name,
                                                  address: place.address,
                                                );
                                          },
                                          icon: Icon(
                                            (isFavoriteAsync?.asData?.value ?? false)
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red.shade400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (busy)
                                      const Positioned(
                                        top: 16,
                                        right: 16,
                                        child: SizedBox(
                                          width: 44,
                                          height: 44,
                                          child: Center(
                                            child: SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: CircularProgressIndicator(strokeWidth: 2),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                // Title Area
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          place.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber.shade400, size: 20),
                                          const SizedBox(width: 4),
                                          Text(
                                            place.rating.toStringAsFixed(1),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceCategory {
  const _PlaceCategory._({
    required this.icon,
    required this.key,
    required this.labelKey,
  });

  const _PlaceCategory.all()
      : this._(icon: Icons.apps, key: null, labelKey: 'all');
  const _PlaceCategory.restaurants()
      : this._(
          icon: Icons.restaurant,
          key: 'Restaurants',
          labelKey: 'restaurants',
        );
  const _PlaceCategory.parks()
      : this._(icon: Icons.park, key: 'Parks', labelKey: 'parks');
  const _PlaceCategory.museums()
      : this._(icon: Icons.museum, key: 'Museums', labelKey: 'museums');

  final IconData icon;

  /// null => "All"
  final String? key;

  final String labelKey;

  String label(AppLocalizations l10n) {
    return switch (labelKey) {
      'all' => l10n.categoryAll,
      'restaurants' => l10n.categoryRestaurants,
      'parks' => l10n.categoryParks,
      'museums' => l10n.categoryMuseums,
      _ => labelKey,
    };
  }
}
