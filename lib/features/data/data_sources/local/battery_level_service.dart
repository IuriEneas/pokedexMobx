import 'package:flutter/services.dart';

class BatteryLevelService {
  static const platform = MethodChannel('com.example/battery');

  Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException {
      return -1;
    }
  }
}
