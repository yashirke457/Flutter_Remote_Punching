import 'dart:isolate';
import 'package:background_locator_2/location_dto.dart';
import 'package:hive/hive.dart';
import 'location_model.dart';

class LocationCallbackHandler {
  static const String _isolateName = 'LocatorIsolate';

  static Future<void> initCallback() async {
    Hive.init('.');
    Hive.registerAdapter(LocationModelAdapter());
    await Hive.openBox<LocationModel>('locations');
    print('>>> isolate initialized');
  }

  static Future<void> disposeCallback() async {
    print('>>> isolate destroyed');
  }

  static Future<void> callback(LocationDto dto) async {
    var box = Hive.box<LocationModel>('locations');
    box.add(LocationModel(
      latitude: dto.latitude,
      longitude: dto.longitude,
      timestamp: DateTime.now(),
    ));
    print(
        '>>> location saved: ${dto.latitude}, ${dto.longitude} @ ${DateTime.now()}');
  }

  static Future<void> notificationCallback() async {
    print('>>> notification clicked');
  }
}
