import 'package:hive/hive.dart';

part 'location_model.g.dart';

@HiveType(typeId: 0)
class LocationModel {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final DateTime timestamp;

  LocationModel(this.latitude, this.longitude, this.timestamp);
}
