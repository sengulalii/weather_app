// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      cityName: json['location']['name'] as String?,
      picture: json['forecast']['forecastday'][0]['day']['condition']['icon']
          as String?,
      weatherstate: json['forecast']['forecastday'][0]['day']['condition']
          ['text'] as String?,
      lastUpdate: json['current']['last_updated'] as String?,
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'] as double?,
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'] as double?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.cityName,
      'icon': instance.picture,
      'text': instance.weatherstate,
      'lastUpdate': instance.lastUpdate,
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
    };
