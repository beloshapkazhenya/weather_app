// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyWeatherResponseModelAdapter
    extends TypeAdapter<HourlyWeatherResponseModel> {
  @override
  final int typeId = 3;

  @override
  HourlyWeatherResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeatherResponseModel(
      timestamp: fields[0] as int,
      temperature: fields[1] as double,
      iconId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyWeatherResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.iconId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
