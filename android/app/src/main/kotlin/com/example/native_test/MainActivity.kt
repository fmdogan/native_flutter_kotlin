package com.example.native_test

import io.flutter.embedding.android.FlutterActivity

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine

import battery_service.*
import download_service.*

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        BatteryService.methodChannelHandler(applicationContext, flutterEngine)
        DownloadService.methodChannelHandler(applicationContext, flutterEngine)
    }
}
