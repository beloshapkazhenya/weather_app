import 'package:hive_flutter/hive_flutter.dart';

part 'current_weather_response_model.g.dart';

@HiveType(typeId: 1)
class CurrentWeatherResponseModel {
  @HiveField(0)
  int timestamp;
  @HiveField(1)
  double temperature;
  @HiveField(2)
  double feelsLikeTemperature;
  @HiveField(3)
  int pressure;
  @HiveField(4)
  int humidity;
  @HiveField(5)
  double windSpeed;
  @HiveField(6)
  String description;
  @HiveField(7)
  String iconId;
  @HiveField(8)
  String locationName;

  CurrentWeatherResponseModel(
      {required this.timestamp,
      required this.temperature,
      required this.feelsLikeTemperature,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.description,
      required this.iconId,
      required this.locationName});

  factory CurrentWeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherResponseModel(
        timestamp: json['dt'],
        temperature: json['main']['temp'],
        feelsLikeTemperature: json['main']['feels_like'] is double ? json['main']['feels_like'] : (json['main']['feels_like'] as int).toDouble(),
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        description: json['weather'][0]['main'],
        iconId: json['weather'][0]['icon'],
        locationName: json['name']);
  }
}
