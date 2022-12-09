import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/model/local/saved_location_model.dart';
import 'package:weather_app/model/net/one_call_response_model.dart';

class LocalRepository {
  List locations = [
    null,
    SavedLocationModel(
        name: 'London', latitude: 51.5073219, longitude: -0.1276474),
    SavedLocationModel(
        name: 'Minsk', latitude: 53.9024716, longitude: 27.5618225),
    SavedLocationModel(
        name: 'Orlando', latitude: 28.5421109, longitude: -81.3790304)
  ];

  Future<OneCallResponseModel?> getLastWeather() async {
    var box = await Hive.openBox<OneCallResponseModel?>('weather');

    return box.get('last');
  }

  saveWeather(OneCallResponseModel weather) async {
    var box = await Hive.openBox<OneCallResponseModel?>('weather');

    box.put('last', weather);
  }

  Future<SavedLocationModel?> getSelectedLocation() async {
    var box = await Hive.openBox<SavedLocationModel?>('location');

    return box.get('selected');
  }

  saveSelectedLocation(SavedLocationModel? location) async {
    var box = await Hive.openBox<SavedLocationModel?>('location');

    box.put('selected', location);
  }
}
