import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  static const routeName = "/MapPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assigned Shops"),
      ),
      body: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(6.93, 79.8612),
          infoWindow: InfoWindow(
            title: "Shop name",
            snippet: "Colombo",
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(6.9271, 79.8612),
          infoWindow: InfoWindow(
            title: "Colombo",
            snippet: "Main City",
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-3'),
          position: LatLng(6.935, 79.862),
          infoWindow: InfoWindow(
            title: "Colombo",
            snippet: "Main City",
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-4'),
          position: LatLng(6.936, 79.868),
          infoWindow: InfoWindow(
            title: "Colombo",
            snippet: "Main City",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:
            CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 15),
      ),
      // floatingActionButton: FloatingActionButton(
      //   foregroundColor: Colors.black,
      //   onPressed: () => _googleMapController.animateCamera(
      //     CameraUpdate.newCameraPosition(_initialCameraPosition),
      //   ),
      //   child: Icon(Icons.center_focus_strong),
      // ),
    );
  }
}
