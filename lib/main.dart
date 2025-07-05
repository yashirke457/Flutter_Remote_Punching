import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:background_locator_2/background_locator.dart';
import 'location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundLocator.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _tracking = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.locationAlways.request();
    await Permission.location.request();
  }

  void _toggleTracking() {
    if (_tracking) {
      LocationService.stop();
    } else {
      LocationService.start();
    }
    setState(() => _tracking = !_tracking);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Tracker')),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleTracking,
          child: Text(_tracking ? 'Stop Tracking' : 'Start Tracking'),
        ),
      ),
    );
  }
}
