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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var markers = <Marker> [
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(41.8781, -87.6298),
        builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        Container(
         padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible(
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(41.8781, -87.6298),
                        zoom: 10.0
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']
                        ),
                        MarkerLayerOptions(markers: markers)
                      ],
                    )
                )
              ]
            )
          )
        ),
    );
  }
}