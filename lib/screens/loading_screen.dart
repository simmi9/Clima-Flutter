import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima/services/networking.dart';

const apiKey = 'e58fc89f3a45bd5abb82026d9b2c3723';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    latitude = loc.latitude;
    longitude = loc.longitude;
    NetworkHelper networkHelper = new NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    try {
      var condition = weatherData[0].id;
      var temperature = weatherData.main.temp;
      var cityName = weatherData.name;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }
}
