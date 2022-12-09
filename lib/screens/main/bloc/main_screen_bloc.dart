import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/local/saved_location_model.dart';
import 'package:weather_app/model/net/one_call_response_model.dart';
import 'package:weather_app/repository/local/local_repository.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/utils/utils.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  NetRepository netRepository;
  LocalRepository localRepository;

  MainScreenBloc(this.netRepository, this.localRepository)
      : super(MainScreenInitial()) {
    on<GetDataEvent>((event, emit) async {
      var savedWeather = await localRepository.getLastWeather();
      bool needShowLoading = true;

      if (savedWeather != null) {
        DateTime savedWeatherDateTime = DateTime.fromMillisecondsSinceEpoch(
            savedWeather.current.timestamp * 1000);
        DateTime nowDateTime = DateTime.now();

        if (savedWeatherDateTime.day == nowDateTime.day &&
            savedWeatherDateTime.month == nowDateTime.month &&
            savedWeatherDateTime.year == nowDateTime.year) {
          needShowLoading = false;
          emit(DataLoadingSuccessState(data: savedWeather));
        }
      }

      add(GetNetDataEvent(needToShowLoading: needShowLoading));
    });

    on<GetNetDataEvent>((event, emit) async {
      if(event.needToShowLoading){
        emit(DataLoadingState());
      }

      try {
        var savedLocation = await localRepository.getSelectedLocation();
        OneCallResponseModel response;

        if (savedLocation == null) {
          var currLocation = await getCurrentPosition();

          response = await netRepository.getData(
              currLocation?.latitude ?? 0.0, currLocation?.longitude ?? 0.0);
        } else {
          response = await netRepository.getData(
              savedLocation.latitude, savedLocation.longitude);
        }

        await  localRepository.saveWeather(response);

        emit(DataLoadingSuccessState(data: response));
      } catch (_) {
        emit(DataLoadingErrorState());
      }
    });
  }
}
