import 'package:flutter/services.dart';

class NativeApi {
  NativeApi._();

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

  static Future<String> getResponse() async {
    String message = "";
    try {
      final result = await platform.invokeMethod('getResponse', [1, 2]);
      message = result.toString();
    } on PlatformException catch (e) {
      message = "Failed to get response: '${e.message}'.";
    }

    return message;
  }
}
