import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:helloworldft/services/api_service.dart';
import 'package:helloworldft/services/mao_restaurants_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '/db/database_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  List<LatLng> routeCoordinates = [];
  List<dynamic> restaurants = [];

  @override
  void initState() {
    super.initState();
    final searchRadius =
        Provider.of<RestaurantsMapsState>(context, listen: false).searchRadius;
    final lat = Provider.of<RestaurantsMapsState>(context, listen: false).lat;
    final lon = Provider.of<RestaurantsMapsState>(context, listen: false).lon;
    loadBars(lat, lon, searchRadius);
    loadMarkers();
  }

  Future<void> loadBars(double lat, double lon, double radius) async {
    List<dynamic> bars = await fetchBars(lat, lon, radius);
    List<Marker> barMarkers = bars.map((bar) {
      return Marker(
        point: LatLng(bar['lat'], bar['lon']),
        width: 100,
        height: 100,
        child: const Icon(
          Icons.add_business_sharp,
          size: 60,
          color: Colors.red,
        ),
      );
    }).toList();
    setState(() {
      restaurants = barMarkers;
    });
  }

  // Load coordiantes from database
  Future<void> loadMarkers() async {
    final dbMarkers = await DatabaseHelper.instance.getCoordinates();
    List<Marker> loadedMarkers = dbMarkers.map((record) {
      return Marker(
        point: LatLng(record['latitude'], record['longitude']),
        width: 80,
        height: 80,
        child: const Icon(
          Icons.add_business_sharp,
          size: 60,
          color: Colors.red,
        ),
      );
    }).toList();
    setState(() {
      markers = loadedMarkers;
    });
  }

  void _showRadiusInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double newRadius =
            Provider.of<RestaurantsMapsState>(context, listen: false)
                .searchRadius;
        return AlertDialog(
          title: const Text('Set Search Radius'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: "Enter radius in meters"),
            onChanged: (value) {
              newRadius = double.tryParse(value) ?? newRadius;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  Provider.of<RestaurantsMapsState>(context, listen: false)
                      .setSearchRadius(newRadius);
                });
                loadBars(
                    Provider.of<RestaurantsMapsState>(context, listen: false)
                        .lat,
                    Provider.of<RestaurantsMapsState>(context, listen: false)
                        .lon,
                    newRadius);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      body: content(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showRadiusInputDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget content() {
    return FlutterMap(
      options: const MapOptions(
          initialCenter: LatLng(40.407621980242745, -3.517071770311644),
          // Centro inicial
          initialZoom: 15,
          interactionOptions: InteractionOptions(flags: InteractiveFlag.all)),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(
            markers: [...markers, ...restaurants]), // Marcadores cargados
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
