import 'package:flutter_riverpod/flutter_riverpod.dart';
_model.dart';
import '../data/services/place_api_service.dart';

final placeApiServiceProvider = Provider((ref) {
  return PlaceApiService();
import '../data/models/place
});

final placesProvider = FutureProvider<List<PlaceModel>>((ref) async {
  final service = ref.read(placeApiServiceProvider);
  return service.fetchPlaces();
});