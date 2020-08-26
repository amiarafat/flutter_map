import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Flutter Google Map",
      home: MapSample(),
    );
  }

}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition loc = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition locPos = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: loc,
        onMapCreated: (GoogleMapController controller){
          _controller.complete();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed:_goToTheLake ,
          label: Text("Go To Lake"),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(locPos));
    final p = CameraPosition(target: LatLng(1.3139961, 103.7041659), zoom: 14.4746);
    controller.animateCamera(CameraUpdate.newCameraPosition(p));
  }
}

