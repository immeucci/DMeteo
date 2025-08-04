import 'package:dmeteo/classes/location.dart';
import 'package:dmeteo/structures/weather_current.dart';
import 'package:dmeteo/structures/weather_day.dart';
import 'package:dmeteo/classes/weather_service.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

/// <summary>
/// WeatherProvider is a ChangeNotifier that manages weather data state for the UI.
/// It fetches weather data based on the user's current location and exposes
/// daily and current weather information.
/// </summary>
class WeatherProvider extends ChangeNotifier {
  /// <summary>
  /// List of daily weather data.
  /// </summary>
  List<WeatherDay>? days;

  /// <summary>
  /// Current weather data.
  /// </summary>
  CurrentWeather? currentWeather;

  /// <summary>
  /// Indicates if weather data is currently being loaded.
  /// </summary>
  late bool isLoading;

  /// <summary>
  /// Stores any error message encountered during data fetching.
  /// </summary>
  String? errorMessage;

  /// <summary>
  /// Internal WeatherService instance used for fetching weather data.
  /// </summary>
  final WeatherService _weatherService = WeatherService();

  /// <summary>
  /// Loads weather data for the user's current location.
  /// Updates [days], [currentWeather], [isLoading], and [errorMessage] accordingly.
  /// Notifies listeners on state changes.
  /// </summary>
  Future<void> loadWeather() async {
    isLoading = true;
    notifyListeners();

    Position position;

    try {
      position = await Location.getCurrentPosition();
    } catch (e) {
      // Handle any errors that occur during the position retrieval process
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return;
    }

    double latitude = position.latitude;
    double longitude = position.longitude;

    try {
      // Fetch weather data from the API
      await _weatherService.fetchWeatherData(
        latitude: latitude,
        longitude: longitude,
      );
    } catch (e) {
      // Handle errors and notify listeners
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return;
    }

    // Parse and store daily and current weather data
    days = _weatherService.getDailyWeatherData();
    currentWeather = _weatherService.getCurrentWeather();

    isLoading = false;
    notifyListeners();
  }
}
