import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// ## [MapWidget] :
///
/// A customizable Flutter widget for displaying a map with a marker at a specific location.
///
/// Use this widget to easily display a map with a marker pinpointing a specific latitude
/// and longitude coordinate on the screen.
///
/// ### Parameters:
///   - `latitude`: The latitude coordinate of the marker's position.
///   - `longitude`: The longitude coordinate of the marker's position.
///   - `zoom`: The initial zoom level of the map (default is 14).
///   - `radius`: The border radius of the map container (default is 10).
///   - `height`: The height of the map container (default is 140).
///   - `margin`: The margin around the map container.
///   - `shadowColor`: The shadow color applied to the map container.
///
/// ### Example:
/// ```dart
/// MapWidget(
///   latitude: 37.7749,
///   longitude: -122.4194,
///   zoom: 16,
///   radius: 8,
///   height: 200,
///   margin: const EdgeInsets.all(16),
///   shadowColor: Colors.grey.withOpacity(0.5),
/// )
/// ```
///
/// This widget uses the `flutter_map` package to render the map and the `latlong2` package
/// for working with latitude and longitude coordinates. The marker is represented by
/// the 'location_on' icon from the `Icons` class and can be customized accordingly.
///
class MapWidget extends StatelessWidget {
  const MapWidget({
    required this.latitude,
    required this.longitude,
    this.zoom = 14,
    this.radius = 10,
    this.height = 140,
    this.margin,
    this.shadowColor,
    Key? key,
  }) : super(key: key);

  final double latitude;
  final double longitude;
  final double zoom;
  final double radius;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          if (shadowColor != null)
            BoxShadow(
              color: shadowColor!,
              blurRadius: 8,
            )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(latitude, longitude),
              zoom: zoom,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(latitude, longitude),
                    width: 24,
                    height: 24,
                    builder: (context) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
