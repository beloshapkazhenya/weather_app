// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentWeatherResponseModelAdapter
    extends TypeAdapter<CurrentWeatherResponseModel> {
  @override
  final int typeId = 1;

  @override
  CurrentWeatherResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeatherResponseModel(
      timestamp: fields[0] as int,
      temperature: fields[1] as double,
      feelsLikeTemperature: fields[2] as double,
      pressure: fields[3] as int,
      humidity: fields[4] as int,
      windSpeed: fields[5] as double,
      description: fields[6] as String,
      iconId: fields[7] as String,
      locationName: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentWeatherResponseModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.feelsLikeTemperature)
      ..writeByte(3)
      ..write(obj.pressure)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.windSpeed)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.iconId)
      ..writeByte(8)
      ..write(obj.locationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
