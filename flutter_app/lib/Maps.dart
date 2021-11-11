import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  Maps({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late MapController mapController;
  late Map<String, LatLng> coords;
  late List<Marker> markers;
  late List<LatLng> points;

  @override
  void initState() {
    super.initState();

    mapController = MapController();

    // Set up dummy data
    coords = Map<String, LatLng>();
    coords.putIfAbsent("Chicago", () => LatLng(41.8781, -87.6298));
    coords.putIfAbsent("Detroit", () => LatLng(42.3314, -83.6458));
    coords.putIfAbsent("Lamsing", () => LatLng(42.7325, -84.5555));

    // Populate maps view elements
    points = <LatLng>[];
    markers = <Marker>[];
    for (int i = 0; i < coords.length; i++) {
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)));
      points.add(coords.values.elementAt(i));
    }
  }

  void showCoord(int index) {
    mapController.move(coords.values.elementAt(index), 10.0);
  }

  List<Widget> makeButtons() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < coords.length; i++) {
      list.add(Container(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed: () => showCoord(i),
              child: Text(coords.keys.elementAt(i)))));
    }
    return list;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeButtons()),
            Flexible(
                child: FlutterMap(
              mapController: mapController,
              options:
                  MapOptions(center: LatLng(41.8781, -87.6298), zoom: 10.0),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: markers),
                PolylineLayerOptions(polylines: [
                  Polyline(
                      points: points, strokeWidth: 4.0, color: Colors.purple)
                ])
              ],
            ))
          ]))),
    );
  }
}
