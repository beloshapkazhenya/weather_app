import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/screens/main/widgets/current/current_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/daily/daily_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/hourly/hourly_weather_overview.dart';
import 'package:weather_app/screens/main/widgets/location_bar.dart';

class MainScreenPortrait extends StatelessWidget {
  const MainScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is DataLoadingSuccessState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: BlocProvider.value(
                  value: BlocProvider.of<MainScreenBloc>(context),
                  child: const LocationBar(),
                ),
              ),
              const CurrentWeatherOverview(),
              const SizedBox(
                height: 20,
              ),
              HourlyWeatherOverview(),
              const SizedBox(
                height: 20,
              ),
              DailyWeatherOverview()
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
      listener: (context, state) {},
    );
  }
}
