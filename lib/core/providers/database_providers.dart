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

