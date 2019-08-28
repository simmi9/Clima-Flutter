import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey = 'e58fc89f3a45bd5abb82026d9b2c3723';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeather();
    if (weatherData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(locationWeather: weatherData);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel weather = WeatherModel();
    var weatherData = weather.getLocationWeather();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
/*
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }*/
}
