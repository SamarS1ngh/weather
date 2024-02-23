// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainImpl _$$MainImplFromJson(Map<String, dynamic> json) => _$MainImpl(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: ((json['feelsLike'] ?? 0) as num).toDouble(),
      tempMin: ((json['tempMin'] ?? 0) as num).toDouble(),
      tempMax: ((json['tempMax'] ?? 0) as num).toDouble(),
      pressure: (json['pressure'] ?? 0) as int,
      humidity: (json['humidity'] ?? 0) as int,
      seaLevel: (json['seaLevel'] ?? 0) as int,
      grndLevel: (json['grndLevel'] ?? 0) as int,
    );

Map<String, dynamic> _$$MainImplToJson(_$MainImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'seaLevel': instance.seaLevel,
      'grndLevel': instance.grndLevel,
    };
