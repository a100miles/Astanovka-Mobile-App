import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final favoritePlacesProvider =
    StreamProvider.family<List<FavoritePlace>, String>((ref, userId) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchFavoritesForUser(userId);
});

@immutable
class FavoriteLookupKey {
  const FavoriteLookupKey({required this.userId, required this.placeId});

  final String userId;
  final String placeId;

  @override
  bool operator ==(Object other) {
    return other is FavoriteLookupKey &&
        other.userId == userId &&
        other.placeId == placeId;
  }

  @override
  int get hashCode => Object.hash(userId, placeId);
}

final isFavoriteProvider =
    StreamProvider.family<bool, FavoriteLookupKey>((ref, key) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchIsFavorite(
    userIdValue: key.userId,
    placeIdValue: key.placeId,
  );
});
