import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/screens/selectlocation/bloc/select_location_screen_bloc.dart';
import 'package:weather_app/utils/utils.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectLocationScreenBloc, SelectLocationScreenState>(
        builder: (context, state) {
      if (state is UpdateLocationsState) {
        return ScrollConfiguration(
            behavior: ScrollBehaviorWithoutGlow(),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<SelectLocationScreenBloc>().add(
                            SaveSelectedLocationEvent(
                                savedLocationModel: state.locations[index]));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.bgDark),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.all(16))),
                      child: Text(
                        state.locations[index] == null
                            ? 'Current'
                            : state.locations[index].name,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: state.locations.length));
      }

      return const SizedBox.shrink();
    }, listener: (context, state) {
      if (state is LocationSavedState) {
        Routes.router.pop(context);
      }
    });
  }
}
