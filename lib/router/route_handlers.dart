import 'package:fluro/fluro.dart';
import 'package:weather_app/screens/main/main_screen.dart';
import 'package:weather_app/screens/selectlocation/select_location_screen.dart';

var mainHandler = Handler(handlerFunc: (context, params) {
  return const MainScreen();
});

var selectLocationHandler = Handler(handlerFunc: (context, params) {
  return const SelectLocationScreen();
});
