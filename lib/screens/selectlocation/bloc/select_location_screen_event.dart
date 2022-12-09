part of 'select_location_screen_bloc.dart';

@immutable
abstract class SelectLocationScreenEvent {
  const SelectLocationScreenEvent();
}

class GetLocationsEvent extends SelectLocationScreenEvent{}

class SaveSelectedLocationEvent extends SelectLocationScreenEvent {
  final SavedLocationModel? savedLocationModel;

  const SaveSelectedLocationEvent({required this.savedLocationModel});
}
