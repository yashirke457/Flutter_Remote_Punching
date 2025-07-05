import 'package:background_locator_2/location_dto.dart';
import 'package:hive/hive.dart';
import 'location_model.dart';

class LocationCallbackHandler {
  // initCallback expects Map<String, dynamic>
  static void initCallback(Map<String, dynamic> _) {
    Hive.init('.');
    Hive.registerAdapter(LocationModelAdapter());
    Hive.openBox<LocationModel>('locations');
    print('>>> isolate initialized');
  }

  // disposeCallback expects NO parameters
  static void disposeCallback() {
    print('>>> isolate destroyed');
  }

  // callback expects LocationDto
  static void callback(LocationDto dto) {
    final box = Hive.box<LocationModel>('locations');
    box.add(LocationModel(
      latitude: dto.latitude,
      longitude: dto.longitude,
      timestamp: DateTime.now(),
    ));

    print('>>> location saved: ${dto.latitude}, ${dto.longitude} @ ${DateTime.now()}');
  }

  // Optional: used when notification is tapped
  static Future<void> notificationCallback() async {
    print('>>> notification clicked');
  }
}
