import 'dart:io';
import 'package:flutter/services.dart';

class DownloadService {
  static const platform = MethodChannel('samples.flutter.dev/download');

  static Future<Directory?> get downloadsDirectory async {
    final String? path = await platform.invokeMethod('getDownloadsDirectory');
    if (path == null) {
      return null;
    }
    return Directory(path);
  }
}
