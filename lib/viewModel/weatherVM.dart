import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/weather.dart';

class WeatherVM extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  DateTime date = DateTime(2024);
  double temp = 0.0;
  String mausam = '';
  String location = '';
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getPostition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lat = position.latitude;
    long = position.longitude;

    notifyListeners();
  }

  Future<void> weatherApi() async {
    Dio dio = Dio();

    Response res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=d49ec9c1918eff5b0dd5fd8cf9efa94c');

    Weather weather = Weather.fromJson(res.data);

    temp = weather.main.temp;
    mausam = weather.weather[0].main;
    location = weather.name;
    notifyListeners();
  }
}
