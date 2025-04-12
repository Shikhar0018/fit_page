import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  /// Checks and requests both fine and coarse location permissions.
  /// Returns true if at least one location permission is granted.
  static Future<bool> requestLocationPermissions() async {
    // Request both location permissions together.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location, // Represents fine location.
      Permission.locationWhenInUse, // For foreground location usage.
    ].request();

    // Check if any one of the permission is granted.
    bool isLocationGranted = statuses[Permission.location] == PermissionStatus.granted ||
        statuses[Permission.locationWhenInUse] == PermissionStatus.granted;

    return isLocationGranted;
  }

  /// Checks if location permissions have been granted.
  static Future<bool> hasLocationPermissions() async {
    final fineStatus = await Permission.location.status;
    final whenInUseStatus = await Permission.locationWhenInUse.status;
    return fineStatus == PermissionStatus.granted || whenInUseStatus == PermissionStatus.granted;
  }
}
