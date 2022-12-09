import 'package:hive_flutter/hive_flutter.dart';

part 'saved_location_model.g.dart';

@HiveType(typeId: 0)
class SavedLocationModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  double latitude;
  @HiveField(2)
  double longitude;

  SavedLocationModel(
      {required this.name, required this.latitude, required this.longitude});
}
