import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/place_model.dart';
import '../data/services/place_api_service.dart';

final placeApiServiceProvider = Provider((ref) {
  return PlaceApiService();
});

final placesProvider = FutureProvider<List<PlaceModel>>((ref) async {
  final service = ref.read(placeApiServiceProvider);
  return service.fetchPlaces();
});

final placeByIdProvider = FutureProvider.family<PlaceModel, int>((ref, id) async {
  final places = await ref.watch(placesProvider.future);
  return places.firstWhere(
    (p) => p.id == id,
    orElse: () => throw StateError('Place with id=$id not found'),
  );
});
