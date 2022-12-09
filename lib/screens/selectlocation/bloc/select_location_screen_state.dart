part of 'select_location_screen_bloc.dart';

@immutable
abstract class SelectLocationScreenState {}

class SelectLocationScreenInitial extends SelectLocationScreenState {}

class UpdateLocationsState extends SelectLocationScreenState {
  final List locations;

  UpdateLocationsState({required this.locations});
}

class LocationSavedState extends SelectLocationScreenState {}
