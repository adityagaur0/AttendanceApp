import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothAttendanceScren extends StatefulWidget {
  const BluetoothAttendanceScren({super.key});

  @override
  State<BluetoothAttendanceScren> createState() =>
      _BluetoothAttendanceScrenState();
}

class _BluetoothAttendanceScrenState extends State<BluetoothAttendanceScren> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  void startScanning() {
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        // Process scan results here and update UI
        print('Device found: ${result.device.name}');
      }
    });
    flutterBlue.startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Attendance'),
      ),
      body: Center(
        child: Text('Scanning for devices...'),
      ),
    );
  }

  @override
  void dispose() {
    flutterBlue.stopScan();
    super.dispose();
  }
}
