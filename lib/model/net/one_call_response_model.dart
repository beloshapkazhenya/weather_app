import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/model/net/current_weather_response_model.dart';
import 'package:weather_app/model/net/daily_weather_response_model.dart';
import 'package:weather_app/model/net/hourly_weather_response_model.dart';

part 'one_call_response_model.g.dart';

@HiveType(typeId: 4)
class OneCallResponseModel {
  @HiveField(0)
  CurrentWeatherResponseModel current;
  @HiveField(1)
  List<HourlyWeatherResponseModel> hourly;
  @HiveField(2)
  List<DailyWeatherResponseModel> daily;

  OneCallResponseModel(
      {required this.current, required this.hourly, required this.daily});

  factory OneCallResponseModel.fromJson(Map<String, dynamic> json) {
    return OneCallResponseModel(
        current: CurrentWeatherResponseModel.fromJson(json['current']),
        hourly: (json['hourly'] as List)
            .map((e) => HourlyWeatherResponseModel.fromJson(e))
            .toList(),
        daily: (json['daily'] as List)
            .map((e) => DailyWeatherResponseModel.fromJson(e))
            .toList());
  }
}
