import 'package:hive_flutter/hive_flutter.dart';

part 'hourly_weather_response_model.g.dart';

@HiveType(typeId: 3)
class HourlyWeatherResponseModel {
  @HiveField(0)
  int timestamp;
  @HiveField(1)
  double temperature;
  @HiveField(2)
  String iconId;

  HourlyWeatherResponseModel(
      {required this.timestamp,
      required this.temperature,
      required this.iconId});

  factory HourlyWeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherResponseModel(
        timestamp: json['dt'],
        temperature: json['main']['temp'] is double ? json['main']['temp'] : (json['main']['temp'] as int).toDouble(),
        iconId: json['weather'][0]['icon']);
  }
}
