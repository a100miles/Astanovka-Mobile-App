import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceAssetImage extends StatelessWidget {
  const PlaceAssetImage({
    super.key,
    required this.placeName,
    this.fit = BoxFit.cover,
  });

  final String placeName;
  final BoxFit fit;

  static const _extensions = <String>['jpeg', 'jpg', 'png', 'webp'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _resolveAssetPath(placeName),
      builder: (context, snapshot) {
        final path = snapshot.data;
        if (path == null) {
          return Container(
            color: Colors.green.shade50,
            child: const Center(
              child: Icon(Icons.image_not_supported_outlined),
            ),
          );
        }

        return Image.asset(path, fit: fit);
      },
    );
  }

  static Future<String?> _resolveAssetPath(String placeName) async {
    final normalized = placeName.trim();
    for (final ext in _extensions) {
      final path = 'assets/$normalized.$ext';
      if (await _assetExists(path)) return path;
    }
    // Try case-insensitive: common in your files (e.g. "national museum.jpeg")
    final lower = normalized.toLowerCase();
    for (final ext in _extensions) {
      final path = 'assets/$lower.$ext';
      if (await _assetExists(path)) return path;
    }
    return null;
  }

  static Future<bool> _assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }
}

