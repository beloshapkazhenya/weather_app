import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/utils/utils.dart';

class CurrentWeatherOverview extends StatelessWidget {
  const CurrentWeatherOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocConsumer<MainScreenBloc, MainScreenState>(
          builder: (context, state) {
            if (state is DataLoadingSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getDateString(DateTime.fromMillisecondsSinceEpoch(
                        state.data.current.timestamp * 1000)),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: NetworkImage(NetRepository.getIconImagePath(
                        state.data.current.iconId)),
                    width: orientation == Orientation.portrait ? 150 : 100,
                    height: orientation == Orientation.portrait ? 150 : 100,
                  ),
                  Text(
                    state.data.current.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: orientation == Orientation.portrait ? 36 : 28,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kelvinToCelsius(state.data.current.temperature)
                              .toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  orientation == Orientation.portrait ? 80 : 60,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'ºC',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  orientation == Orientation.portrait ? 40 : 30,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.water_drop_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text(
                            'HUMIDITY',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${state.data.current.humidity.toInt()}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.av_timer_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text(
                            'PRESSURE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${state.data.current.pressure} hPa',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.wind_power,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text(
                            'WIND',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${state.data.current.windSpeed} m/sec',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.thermostat_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text(
                            'FEELS LIKE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${kelvinToCelsius(state.data.current.feelsLikeTemperature.toDouble())}ºC',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              );
            }

            return const SizedBox.shrink();
          },
          listener: (context, state) {});
    });
  }
}
