import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/utils/utils.dart';

class DailyWeatherOverview extends StatelessWidget {
  DailyWeatherOverview({Key? key}) : super(key: key);

  final testList = List.generate(10, (index) => index);

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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getShortDateString(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      state.data.daily[index].timestamp *1000)),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Image(
                              image: NetworkImage(
                                  NetRepository.getIconImagePath(
                                      state.data.daily[index].iconId)),
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              '${kelvinToCelsius(state.data.daily[index].temperature)}ºC',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 32,
                          ),
                      itemCount: state.data.daily.length)),
            ));
          }

          return const SizedBox.shrink();
        },
        listener: (context, state) {});
  }
}
