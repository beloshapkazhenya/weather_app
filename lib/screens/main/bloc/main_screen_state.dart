part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class DataLoadingState extends MainScreenState {}

class DataLoadingErrorState extends MainScreenState {}

class DataLoadingSuccessState extends MainScreenState {
  final OneCallResponseModel data;

  DataLoadingSuccessState({required this.data});
}
