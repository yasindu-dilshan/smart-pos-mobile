import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/pages/shop_home_page.dart';
import 'package:smart_pos_mobile/services/shop_service.dart';

class MapPage extends StatelessWidget {
  static const routeName = '/MapPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assigned Shops'),
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
  late List<Shop> shopList;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      for (var i = 0; i < shopList.length; i++) {
        var shop = shopList[i];
        print(double.parse(shop.latitude));
        print('gg');
        _markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(
                double.parse(shop.latitude), double.parse(shop.longitude)),
            infoWindow: InfoWindow(
              title: shop.name,
              snippet: shop.location,
              onTap: () {
                Navigator.of(context).pushNamed(ShopHomePage.routeName,
                    arguments: ShopHomeArguments(shop: shop));
              },
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ShopService.getAssignedShops(Config.USER_ID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        } else if (snapshot.hasData) {
          shopList = snapshot.data as List<Shop>;
          return GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition:
                CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 15),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
