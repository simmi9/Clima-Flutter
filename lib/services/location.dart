import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  // Location({this.longitude, this.latitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
