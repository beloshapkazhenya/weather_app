part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {
  const MainScreenEvent();
}

class GetNetDataEvent extends MainScreenEvent {
  final bool needToShowLoading;

  const GetNetDataEvent({required this.needToShowLoading});
}

class GetDataEvent extends MainScreenEvent {
  const GetDataEvent();
}
