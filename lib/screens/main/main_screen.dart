import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/repository/local/local_repository.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';
import 'package:weather_app/screens/main/widgets/main_screen_landscape.dart';
import 'package:weather_app/screens/main/widgets/main_screen_portrait.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (context) => MainScreenBloc(NetRepository(), LocalRepository())
        ..add(const GetDataEvent()),
      child: Container(
          color: AppColors.bgGradientStart,
          child: SafeArea(
              child: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  AppColors.bgGradientStart,
                  AppColors.bgGradientEnd
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: OrientationBuilder(builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return const MainScreenPortrait();
                  } else {
                    return const MainScreenLandscape();
                  }
                })),
          ))),
    );
  }
}
