import 'package:flutter/services.dart';

class BatteryService {
  BatteryService._();

  static const platform = MethodChannel('samples.flutter.dev/battery');

  static Future<int> getBatteryLevel() async {
    int result;
    try {
      result = await platform.invokeMethod('getBatteryLevel');
    } on PlatformException catch (e) {
      result = -1;
    }

    return result;
  }

  static Future<String> testArguments() async {
    String message = "";
    try {
      final result = await platform.invokeMethod('testArguments', {"first": 1, "second": 2});
      message = result.toString();
    } on PlatformException catch (e) {
      message = "Failed to get response: '${e.message}'.";
    }

    return message;
  }
}
