import 'package:geolocator/geolocator.dart';

/// Manages access to the device's geographic location.
///
/// This class provides methods to obtain the user's current position,
/// automatically handling the necessary permissions and checking the
/// availability of location services.
class Location {
  /// Determines the current position of the device.
  ///
  /// This static method handles the complete process of obtaining the position:
  /// 1. Checks if location services are enabled
  /// 2. Verifies and requests necessary permissions
  /// 3. Gets the current position
  ///
  /// Returns: A [Future<Position>] that resolves with the current position
  ///
  /// Throws:
  /// - [Future.error] if location services are disabled
  /// - [Future.error] if permissions are denied
  /// - [Future.error] if permissions are permanently denied
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled on the device
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check current location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permissions if they haven't been granted
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // Check if permissions have been permanently denied
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // Get and return the current position
    return await Geolocator.getCurrentPosition();
  }
}
