import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'weather_element.freezed.dart';
part 'weather_element.g.dart';

@freezed
class WeatherElement with _$WeatherElement {
  const factory WeatherElement({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherElement;

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);
}
