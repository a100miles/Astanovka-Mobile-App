import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_providers.dart';

final favoritesControllerProvider =
    NotifierProvider<FavoritesController, Set<int>>(FavoritesController.new);

class FavoritesController extends Notifier<Set<int>> {
  @override
  Set<int> build() => <int>{};

  bool isBusy(int placeId) => state.contains(placeId);

  Future<void> toggle({
    required String userId,
    required int placeId,
    required bool isFavorite,
    required String name,
    required String address,
  }) async {
    if (state.contains(placeId)) return;
    state = {...state, placeId};
    try {
      final db = ref.read(appDatabaseProvider);
      if (isFavorite) {
        await db.removeFavorite(
          userIdValue: userId,
          placeIdValue: placeId.toString(),
        );
      } else {
        await db.addOrUpdateFavorite(
          userIdValue: userId,
          placeIdValue: placeId.toString(),
          nameValue: name,
          addressValue: address,
        );
      }
    } finally {
      final next = {...state}..remove(placeId);
      state = next;
    }
  }
}
