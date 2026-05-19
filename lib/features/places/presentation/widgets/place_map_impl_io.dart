import 'package:dgis_mobile_sdk_full/dgis.dart' as sdk;
import 'package:flutter/material.dart';

class PlaceMapBody extends StatefulWidget {
  const PlaceMapBody({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
  });

  final double latitude;
  final double longitude;
  final String title;

  static const String dgisKey = '9f446a09-9e18-4759-b3a9-6cff2a5e67dc';

  @override
  State<PlaceMapBody> createState() => _PlaceMapBodyState();
}

class _PlaceMapBodyState extends State<PlaceMapBody> {
  late final sdk.Context _sdkContext;
  final sdk.MapWidgetController _controller = sdk.MapWidgetController();
  sdk.MapObjectManager? _objectManager;

  @override
  void initState() {
    super.initState();
    _sdkContext = sdk.DGis.initialize(
      keySource: sdk.KeySource.fromString(
        const sdk.KeyFromString(PlaceMapBody.dgisKey),
      ),
    );

    _controller.getMapAsync((map) {
      _objectManager ??= sdk.MapObjectManager(map);

      final point = sdk.GeoPoint(
        latitude: sdk.Latitude(widget.latitude),
        longitude: sdk.Longitude(widget.longitude),
      );

      map.camera.move(
        point,
        const sdk.Zoom(16),
        null,
        const sdk.Bearing(0),
        const Duration(milliseconds: 600),
        sdk.CameraAnimationType.linear,
      );

      final marker = sdk.Marker(
        sdk.MarkerOptions(
          position: sdk.GeoPointWithElevation(
            latitude: sdk.Latitude(widget.latitude),
            longitude: sdk.Longitude(widget.longitude),
          ),
          icon: null,
        ),
      );

      _objectManager!.removeAll();
      _objectManager!.addObject(marker);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return sdk.MapWidget(
      sdkContext: _sdkContext,
      mapOptions: sdk.MapOptions(),
      controller: _controller,
    );
  }
}
