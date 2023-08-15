import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    this.mapController,
    this.markers,
    this.center,
    this.zoom,
    this.minZoom = 3.5,
    this.onTap,
    this.onPositionChanged,
    this.interactiveFlag = InteractiveFlag.all,
  });

  final MapController? mapController;
  final List<Marker>? markers;
  final LatLng? center;
  final double? zoom;
  final double minZoom;

  final int interactiveFlag;

  final void Function(dynamic tapPosition, LatLng point)? onTap;
  final void Function(MapPosition position, bool hasGesture)? onPositionChanged;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: onTap,
        onPositionChanged: onPositionChanged,
        center: center ?? LatLng(43.181278, 76.892298),
        zoom: zoom ?? 5,
        maxZoom: 17,
        minZoom: minZoom,
        interactiveFlags: interactiveFlag,
      ),
      layers: [
        TileLayerOptions(
          maxNativeZoom: 17,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          retinaMode: true,
        ),
        MarkerLayerOptions(
          markers: markers ?? [],
        ),
      ],
    );
  }
}
