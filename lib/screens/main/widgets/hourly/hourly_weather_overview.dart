import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/screens/main/widgets/hourly/hour_weather_item.dart';
import 'package:weather_app/utils/utils.dart';

class HourlyWeatherOverview extends StatelessWidget {
  HourlyWeatherOverview({Key? key}) : super(key: key);

  final testList = List.generate(24, (index) => index);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is DataLoadingSuccessState) {
            return Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.bgDark),
              child: ScrollConfiguration(
                  behavior: ScrollBehaviorWithoutGlow(),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return HourWeatherItem(
                          data: state.data.hourly[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 32,
                          ),
                      itemCount: state.data.hourly.length)),
            ));
          }

          return const SizedBox.shrink();
        },
        listener: (context, state) {});
  }
}
