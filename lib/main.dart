import 'package:flutter/material.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundLocator.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Tracker',
      home: LocationHome(),
    );
  }
}

class LocationHome extends StatefulWidget {
  @override
  State<LocationHome> createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationHome> {
  bool isTracking = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    var status = await Permission.locationAlways.request();
    if (!status.isGranted) {
      openAppSettings();
    }
  }

  void _start() {
    LocationService.start();
    setState(() {
      isTracking = true;
    });
  }

  void _stop() {
    LocationService.stop();
    setState(() {
      isTracking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isTracking
                ? ElevatedButton(onPressed: _stop, child: Text("Stop Tracking"))
                : ElevatedButton(onPressed: _start, child: Text("Start Tracking")),
          ],
        ),
      ),
    );
  }
}
