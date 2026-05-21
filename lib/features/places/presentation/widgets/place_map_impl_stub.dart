import 'package:flutter/material.dart';

class PlaceMapBody extends StatelessWidget {
  const PlaceMapBody({
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
    return const Center(
      child: Text(
        '2GIS map is only available on mobile (Android/iOS).',
        textAlign: TextAlign.center,
      ),
    );
  }
}

