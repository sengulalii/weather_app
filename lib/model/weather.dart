import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  String? cityName;
  String? picture;
  String? weatherstate;
  String? lastUpdate;
  double? maxTemp;
  double? minTemp;

  Weather(
      {this.cityName,
      this.picture,
      this.weatherstate,
      this.lastUpdate,
      this.minTemp,
      this.maxTemp});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
