import 'package:flutter/material.dart';

class PlaceInfoScreen extends StatelessWidget {
  final String placeName;
  final String placeDescription;
  final String placeImageUrl;

  const PlaceInfoScreen({
    Key? key,
    required this.placeName,
    required this.placeDescription,
    required this.placeImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (placeImageUrl.isNotEmpty)
              Image.network(placeImageUrl),
            const SizedBox(height: 16),
            Text(
              placeName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              placeDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}