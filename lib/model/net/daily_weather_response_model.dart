import 'package:hive/hive.dart';

part 'daily_weather_response_model.g.dart';

@HiveType(typeId: 2)
class DailyWeatherResponseModel {
  @HiveField(0)
  int timestamp;
  @HiveField(1)
  double temperature;
  @HiveField(2)
  String iconId;

  DailyWeatherResponseModel(
      {required this.timestamp,
      required this.temperature,
      required this.iconId});

  factory DailyWeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherResponseModel(
        timestamp: json['dt'],
        temperature: json['main']['temp'] is double
            ? json['main']['temp']
            : (json['main']['temp'] as int).toDouble(),
        iconId: json['weather'][0]['icon']);
  }
}
