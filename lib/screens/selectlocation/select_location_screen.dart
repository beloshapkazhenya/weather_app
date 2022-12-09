import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/repository/local/local_repository.dart';
import 'package:weather_app/screens/selectlocation/bloc/select_location_screen_bloc.dart';
import 'package:weather_app/screens/selectlocation/widgets/locations_list.dart';
import 'package:weather_app/utils/utils.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectLocationScreenBloc>(
      create: (context) =>
          SelectLocationScreenBloc(LocalRepository())..add(GetLocationsEvent()),
      child: Container(
          color: AppColors.bgGradientStart,
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bgGradientStart,
              elevation: 0,
              title: const Text(
                'Select Location',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  AppColors.bgGradientStart,
                  AppColors.bgGradientEnd
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Center(
                    child: LocationsList(),
                  ),
                )),
          ))),
    );
  }
}
