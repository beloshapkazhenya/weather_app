import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class ScrollBehaviorWithoutGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

String getDateString(DateTime dateTime) {
  String dateString = '';
  var currentDay = DateTime.now();

  if (dateTime.day == currentDay.day &&
      dateTime.month == currentDay.month &&
      dateTime.year == currentDay.year) {
    dateString += 'Today, ';
  }

  dateString += DateFormat.MMMMd().format(dateTime);

  return dateString;
}

String getShortDateString(DateTime dateTime) {
  return DateFormat.MMMd().format(dateTime);
}

String getTimeStringFromDateTime(DateTime dateTime) {
  return dateTime.hour < 10 ? '0${dateTime.hour}:00' : '${dateTime.hour}:00';
}

int kelvinToCelsius(double temp) => temp.toInt() - 273;

Future<Position?> getCurrentPosition() async {
  final hasPermission = await _handleLocationPermission();
  if (!hasPermission) return null;
  var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
      .catchError((e) {
    debugPrint(e);
  });

  return position;
}

Future<bool> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return false;
  }
  return true;
}
