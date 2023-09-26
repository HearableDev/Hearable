import 'package:flutter/foundation.dart';

class SensorData {
  bool isEnabled9AxisSensor = false;
  bool isEnabledTemperature = false;
  bool isEnabledHeartRate = false;
  bool isEnabledPpg = false;

  Uint8List nineAxisSensor = Uint8List(111);
  Uint8List temperature = Uint8List(8);
  late Uint8List heartRate;
  late Uint8List ppg;

  static final SensorData _instance = SensorData._internal();

  factory SensorData() {
    return _instance;
  }

  SensorData._internal();
}
