import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator_2/location_dto.dart';

class LocationCallbackHandler {
  static const String isolateName = 'LocatorIsolate';

  static Future<void> initCallback() async {
    print("Init callback called");
  }

  static Future<void> disposeCallback() async {
    print("Dispose callback called");
  }

  static Future<void> callback(LocationDto locationDto) async {
    print('Location updated: ${locationDto.latitude}, ${locationDto.longitude}');
    // You can store it to Hive or send to server here.
  }

  static Future<void> notificationCallback() async {
    print("Notification clicked");
  }
}
