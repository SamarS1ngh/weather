import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class Main with _$Main {
  const factory Main({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    int pressure,
    int humidity,
    int seaLevel,
    int grndLevel,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}
