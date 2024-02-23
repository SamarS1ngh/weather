import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/model/clouds.dart';
import 'dart:convert';

import 'package:weather_app/model/coord.dart';
import 'package:weather_app/model/main.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather_element.dart';
import 'package:weather_app/model/wind.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required Coord coord,
    required List<WeatherElement> weather,
    required String base,
    required Main main,
    required int visibility,
    required Wind wind,
    required Clouds clouds,
    required int dt,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
