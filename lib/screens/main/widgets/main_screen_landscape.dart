import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/screens/main/widgets/current/current_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/daily/daily_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/hourly/hourly_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/location_bar.dart';

class MainScreenLandscape extends StatelessWidget {
  const MainScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is DataLoadingSuccessState) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(child: CurrentWeatherOverview()),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const LocationBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyWeatherOverview(),
                    const SizedBox(
                      height: 20,
                    ),
                    DailyWeatherOverview()
                  ],
                ))
              ],
            );
          }

          if (state is DataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.bgDark,
              ),
            );
          }

          if (state is DataLoadingErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }

          return const Center();
        },
        listener: (context, state) {});
  }
}
