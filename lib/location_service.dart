import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'location_callback_handler.dart';

class LocationService {
  static void start() {
    BackgroundLocator.registerLocationUpdate(
      LocationCallbackHandler.callback,
      initCallback: LocationCallbackHandler.initCallback,
      disposeCallback: LocationCallbackHandler.disposeCallback,
      androidSettings: AndroidSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        interval: 60,
        distanceFilter: 0,
        androidNotificationSettings: AndroidNotificationSettings(
          notificationChannelName: 'Location Tracking',
          notificationTitle: 'Tracking in background',
          notificationMsg: 'Tap to return to the app',
          notificationBigMsg: 'Your location is being recorded',
          notificationIcon: '',
          notificationTapCallback:
          LocationCallbackHandler.notificationCallback,
        ),
      ),
      iosSettings: IOSSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        distanceFilter: 0,
      ),
      autoStop: false,
    );
  }

  static void stop() {
    BackgroundLocator.unRegisterLocationUpdate();
  }
}
