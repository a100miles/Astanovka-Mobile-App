import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/place_model.dart';
import '../mock/mock_places.dart';

class PlaceApiService {
  static const String baseUrl = 'https://2gis.kz/astana';

  Future<List<PlaceModel>> fetchPlaces() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data
            .map((json) => PlaceModel.fromJson(json))
            .toList();
      }

      return mockPlaces;
    } catch (e) {
      return mockPlaces;
    }
  }
}