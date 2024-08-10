import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapSelectPage extends StatefulWidget {
  //const MapSelectPage({Key? key}) : super(key: key);
  final LatLng mapcode;

  MapSelectPage({required this.mapcode});
  @override
  _MapSelectPageState createState() => _MapSelectPageState();
}

class _MapSelectPageState extends State<MapSelectPage> {
  final Completer<GoogleMapController> _mapcontroller = Completer();
  Marker? _marker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('位置を選択'),
        actions: [
          TextButton(
            onPressed: () {
              if (_marker != null) {
                Navigator.pop(context, _marker!.position);
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text(
              '保存',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _marker != null ? {_marker!} : {},
        initialCameraPosition: CameraPosition(
          target: widget.mapcode,
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapcontroller.complete(controller);
        },
        onTap: _handleTap,
      ),
    );
  }

  void _handleTap(LatLng tappedPoint) {
    setState(
      () {
        _marker = Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        );
      },
    );
  }
}
