import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

/// ## [MapLocationWidget] :
///
/// A Flutter widget that displays a map with customizable options and the ability
/// to interact with the map and select a location. It also provides the user's current
/// location as an option.
///
/// This widget allows you to display a map with markers for both the specified location
/// and a selected location. Users can long-press on the map to choose a different location.
///
/// ### Parameters:
///   - `latitude`: The latitude coordinate of the initial marker's position.
///   - `longitude`: The longitude coordinate of the initial marker's position.
///   - `zoom`: The initial zoom level of the map (default is 14).
///   - `radius`: The border radius of the map container (default is 10).
///   - `height`: The height of the map container (default is 140).
///   - `margin`: The margin around the map container.
///   - `shadowColor`: The shadow color applied to the map container.
///   - `showCurrentLocation`: a bool to show user location or not.
///   - `onLocationChanged`: A callback function that is called when the selected
///     location on the map is changed. It provides the new location as a `LatLng` object.
///
/// ### Example:
/// ```dart
/// MapLocationWidget(
///   latitude: 37.7749,
///   longitude: -122.4194,
///   zoom: 16,
///   radius: 8,
///   height: 200,
///   margin: const EdgeInsets.all(16),
///   shadowColor: Colors.grey.withOpacity(0.5),
///   onLocationChanged: (LatLng latLng) {
///     // Handle the selected location change here
///     print("Selected Location: $latLng");
///   },
/// )
/// ```
///
/// This widget provides an interactive map where users can select a location by
/// long-pressing on the map. The selected location can be accessed using the
/// `selectedLocation` property of the widget's state.
///
/// Note:
///   - To use the user's current location, ensure that location permissions are granted.
///
class MapLocationWidget extends StatefulWidget {
  const MapLocationWidget({
    required this.latitude,
    required this.longitude,
    this.zoom = 14,
    this.radius = 10,
    this.height = 140,
    this.margin,
    this.shadowColor,
    this.showCurrentLocation = true,
    this.onLocationChanged,
    Key? key,
  }) : super(key: key);

  final double latitude;
  final double longitude;
  final double zoom;
  final double radius;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final bool showCurrentLocation;
  final void Function(LatLng latLng)? onLocationChanged;

  @override
  State<MapLocationWidget> createState() => MapLocationWidgetState();
}

class MapLocationWidgetState extends State<MapLocationWidget> {
  LatLng? _selectedLocation;

  LatLng? get selectedLocation => _selectedLocation;
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    if (widget.showCurrentLocation) {
      _getUserLocation();
    }
  }

  Future<void> _getUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      _selectedLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      _mapController.move(_selectedLocation!, 16);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: [
          if (widget.shadowColor != null)
            BoxShadow(
              color: widget.shadowColor!,
              blurRadius: 8,
            )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: SizedBox(
          width: double.infinity,
          height: widget.height,
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
                center: LatLng(widget.latitude, widget.longitude),
                zoom: widget.zoom,
                onLongPress: (tapPosition, latLng) {
                  setState(() {
                    _selectedLocation = latLng;
                    widget.onLocationChanged?.call(latLng);
                  });
                }),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.latitude, widget.longitude),
                    width: 24,
                    height: 24,
                    builder: (context) => const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                  ),
                  if (_selectedLocation != null)
                    Marker(
                      point: _selectedLocation!,
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
