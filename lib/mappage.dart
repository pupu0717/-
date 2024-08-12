import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'database.dart';

//Googleマップのページ
class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  GoogleMapPageState createState() => GoogleMapPageState();
}

class GoogleMapPageState extends State<GoogleMapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(35, 138),
    zoom: 4.5,
  );

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    final records = await DatabaseHelper.instance.readAllRecords('日付降順');

    if (records.isNotEmpty) {
      final List<LatLng> latLngList = [];
      final List<Marker> markers = [];

      for (var record in records) {
        final coordinateStr = record['coodinate'] as String?;
        if (coordinateStr != null && coordinateStr.isNotEmpty) {
          try {
            final Map<String, dynamic> coordinates = jsonDecode(coordinateStr);
            final latitude = coordinates['latitude'] as double?;
            final longitude = coordinates['longitude'] as double?;
            if (latitude != null && longitude != null) {
              final latLng = LatLng(latitude, longitude);
              latLngList.add(latLng);
              markers.add(
                Marker(
                  markerId: MarkerId(record['id'].toString()),
                  position: latLng,
                  infoWindow: InfoWindow(
                      title: '${record['point']}',
                      snippet: '${record['date']}'),
                ),
              );
            }
          } catch (e) {}
        }
      }

      // マーカーがある場合、カメラ位置を調整
      if (latLngList.isNotEmpty) {
        setState(() {
          _markers = markers.toSet();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition));
        },
      ),
    );
  }
}
