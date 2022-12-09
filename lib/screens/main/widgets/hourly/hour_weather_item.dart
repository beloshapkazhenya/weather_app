import 'package:flutter/material.dart';
import 'package:weather_app/model/net/hourly_weather_response_model.dart';
import 'package:weather_app/repository/net/net_repository.dart';
import 'package:weather_app/utils/utils.dart';

class HourWeatherItem extends StatelessWidget {
  const HourWeatherItem({Key? key, required this.data}) : super(key: key);

  final HourlyWeatherResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTimeStringFromDateTime(
              DateTime.fromMillisecondsSinceEpoch(data.timestamp * 1000)),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Image(
          image: NetworkImage(NetRepository.getIconImagePath(data.iconId)),
          width: 30,
          height: 30,
        ),
        Text(
          '${kelvinToCelsius(data.temperature)}ºC',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
