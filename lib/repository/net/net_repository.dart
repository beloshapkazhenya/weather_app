import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/net/current_weather_response_model.dart';
import 'package:weather_app/model/net/daily_weather_response_model.dart';
import 'package:weather_app/model/net/hourly_weather_response_model.dart';
import 'package:weather_app/model/net/one_call_response_model.dart';

class NetRepository {
  static const baseUrl = "https://api.openweathermap.org/";

  static const exclude = "minutely,alert";
  static const apiKey = '78248e69e3f22410357abedc5baa2beb';

  static Uri currentWeatherEndpointUri(double lat, double lon) =>
      Uri.parse('${baseUrl}data/2.5/weather?lat=$lat&lon=$lon&APPID=$apiKey');

  static Uri forecastEndpointUri(double lat, double lon) => Uri.parse(
      '${baseUrl}data/2.5/forecast?lat=$lat&lon=$lon&cnt=40&APPID=$apiKey');

  static String getIconImagePath(String iconId) =>
      'https://openweathermap.org/img/wn/$iconId@2x.png';

  Future<OneCallResponseModel> getData(double lat, double lon) async {
    try {
      http.Response currentWeatherResponse =
          await http.get(currentWeatherEndpointUri(lat, lon));
      http.Response forecastWeatherResponse =
          await http.get(forecastEndpointUri(lat, lon));

      if (currentWeatherResponse.statusCode == 200 &&
          forecastWeatherResponse.statusCode == 200) {
        var decodedCurrentWeatherResponse =
            convert.jsonDecode(currentWeatherResponse.body);
        List decodedForecastWeatherResponse =
            convert.jsonDecode(forecastWeatherResponse.body)['list'];

        CurrentWeatherResponseModel currentWeather =
            CurrentWeatherResponseModel.fromJson(decodedCurrentWeatherResponse);
        List<HourlyWeatherResponseModel> hourlyWeather =
            decodedForecastWeatherResponse
                .take(8)
                .map((e) => HourlyWeatherResponseModel.fromJson(e))
                .toList();
        List<DailyWeatherResponseModel> dailyWeather =
            decodedForecastWeatherResponse
                .asMap()
                .entries
                .where((entry) => entry.key % 8 == 0)
                .map((e) => DailyWeatherResponseModel.fromJson(e.value))
                .toList();

        return OneCallResponseModel(
            current: currentWeather,
            daily: dailyWeather,
            hourly: hourlyWeather);
      } else {
        throw 'Error ${currentWeatherResponse.statusCode}, ${forecastWeatherResponse.statusCode}';
      }
    } catch (error) {
      debugPrint('net request error');
      throw error.toString();
    }
  }
}
