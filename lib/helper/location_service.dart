import 'package:fit_page/helper/databaseHelper/db_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LocationServiceStrings {
  static const String startService = 'startLocationService';
  static const String getLastLocation = 'getLastLocation';
  static const String platformChannel = 'location';
  static const String eventChannel = 'location_updates';
}

class LocationService {
  static const platform = MethodChannel(LocationServiceStrings.platformChannel);
  static const eventChannel = EventChannel(LocationServiceStrings.eventChannel);

  DatabaseHelper dbHelper = DatabaseHelper();
  Future<Database> get database async => await dbHelper.database;

  Future<void> insertLocation(double lat, double lng) async {
    final db = await database;
    await db.insert(
      'locations',
      {'latitude': lat, 'longitude': lng},
    );
  }

  Future<List<Map<String, dynamic>>> getLocations() async {
    final db = await database;
    return db.query('locations', orderBy: 'timestamp DESC');
  }

  Future<Map<String, dynamic>?> getLastLocation() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'locations',
      orderBy: 'timestamp DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Stream<String> get locationStream => eventChannel.receiveBroadcastStream().map((data) {
        if (data is Map) {
          final double lat = data['latitude'];
          final double lng = data['longitude'];
          insertLocation(lat, lng);
        }

        return data.toString();
      });

  Future<void> startService() async {
    try {
      await platform.invokeMethod(LocationServiceStrings.startService);
    } on PlatformException catch (e) {
      debugPrint("Failed to start service: '${e.message}'.");
      throw Exception('Service start failed: ${e.message}');
    }
  }
}
