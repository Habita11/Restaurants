import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition:CameraPosition(
            target: LatLng(31, 31),
          zoom: 30,
          tilt: 60,
          bearing:30
        ),
      mapType: MapType.terrain,
    );
  }
}
