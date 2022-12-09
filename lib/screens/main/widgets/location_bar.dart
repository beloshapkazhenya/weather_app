import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/screens/main/bloc/main_screen_bloc.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is DataLoadingSuccessState) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.white,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () {
                      Routes.router
                          .navigateTo(context, Routes.selectLocation)
                          .then((value) => context.read<MainScreenBloc>().add(
                              const GetNetDataEvent(needToShowLoading: true)));
                    },
                    child: Text(
                      state.data.current.locationName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      context
                          .read<MainScreenBloc>()
                          .add(const GetNetDataEvent(needToShowLoading: true));
                    },
                    icon: const Icon(
                      Icons.autorenew_outlined,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            );
          }
          return const SizedBox.shrink();
        },
        listener: (context, state) {});
  }
}
