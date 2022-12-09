import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/local/saved_location_model.dart';
import 'package:weather_app/repository/local/local_repository.dart';

part 'select_location_screen_event.dart';
part 'select_location_screen_state.dart';

class SelectLocationScreenBloc
    extends Bloc<SelectLocationScreenEvent, SelectLocationScreenState> {
  LocalRepository localRepository;

  SelectLocationScreenBloc(this.localRepository)
      : super(SelectLocationScreenInitial()) {
    on<GetLocationsEvent>((event, emit) async {
      var locations = localRepository.locations;

      emit(UpdateLocationsState(locations: locations));
    });

    on<SaveSelectedLocationEvent>((event, emit) async {
      await localRepository.saveSelectedLocation(event.savedLocationModel);

      emit(LocationSavedState());
    });
  }
}
