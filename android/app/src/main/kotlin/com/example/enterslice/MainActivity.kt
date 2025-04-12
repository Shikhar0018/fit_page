package com.example.enterslice

import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    @RequiresApi(Build.VERSION_CODES.O)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Method Channel Setup
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "location").setMethodCallHandler { call, result ->
            when (call.method) {
                "startLocationService" -> {
                    Intent(applicationContext, LocationService::class.java).also {
                        startForegroundService(it)
                    }
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        // Event Channel Setup
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "location_updates")
            .setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    LocationService.eventSink = events
                }
                override fun onCancel(arguments: Any?) {
                    LocationService.eventSink = null
                }
            })
    }
}