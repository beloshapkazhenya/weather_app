// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_call_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneCallResponseModelAdapter extends TypeAdapter<OneCallResponseModel> {
  @override
  final int typeId = 4;

  @override
  OneCallResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneCallResponseModel(
      current: fields[0] as CurrentWeatherResponseModel,
      hourly: (fields[1] as List).cast<HourlyWeatherResponseModel>(),
      daily: (fields[2] as List).cast<DailyWeatherResponseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, OneCallResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.hourly)
      ..writeByte(2)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneCallResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
