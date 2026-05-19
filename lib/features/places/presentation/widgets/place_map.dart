import 'package:flutter/widgets.dart';

import 'place_map_impl_stub.dart'
    if (dart.library.io) 'place_map_impl_io.dart';

class PlaceMap extends StatelessWidget {
  const PlaceMap({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
  });

  final double latitude;
  final double longitude;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PlaceMapBody(
      latitude: latitude,
      longitude: longitude,
      title: title,
    );
  }
}
