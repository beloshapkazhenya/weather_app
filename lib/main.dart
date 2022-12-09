import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/model/local/saved_location_model.dart';
import 'package:weather_app/model/net/current_weather_response_model.dart';
import 'package:weather_app/model/net/daily_weather_response_model.dart';
import 'package:weather_app/model/net/hourly_weather_response_model.dart';
import 'package:weather_app/model/net/one_call_response_model.dart';
import 'package:weather_app/router/router.dart';

void main() async {
  var appRouter = FluroRouter();
  Routes.configureRoutes(appRouter);
  Routes.router = appRouter;

  await Hive.initFlutter();

  Hive
    ..registerAdapter(SavedLocationModelAdapter())
    ..registerAdapter(CurrentWeatherResponseModelAdapter())
    ..registerAdapter(DailyWeatherResponseModelAdapter())
    ..registerAdapter(HourlyWeatherResponseModelAdapter())
    ..registerAdapter(OneCallResponseModelAdapter());

  runApp(MaterialApp(
    onGenerateRoute: appRouter.generator,
    title: 'Weather',
    debugShowCheckedModeBanner: false,
  ));
}
