import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition cameraPosition = CameraPosition(target: LatLng(31.466404, 34.423413),
      zoom: 15);

  Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission()async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if(status.isGranted){
      print("permission is granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        compassEnabled: true,
        mapType: MapType.terrain,

        onTap: (LatLng latLng){
          Marker marker = Marker(markerId: MarkerId("marker_${_markers.length}"),
          position: latLng,
          infoWindow: InfoWindow(
            title: "Marker_${_markers.length}", snippet: "Marker",
          ),
            onTap: ()=> print('Marker_${_markers.length}'),
            visible: true,
          );
          setState(() =>_markers.add(marker));
        },
        markers: _markers,
        //**********************
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}

