import 'weather_code.dart';

/// <summary>
/// Represents weather data for a specific hour.
/// This class contains all relevant meteorological information for a given moment,
/// including temperature, humidity, and atmospheric conditions.
/// </summary>
class WeatherHour {
  /// <summary>
  /// The specific time for this weather data.
  /// </summary>
  final DateTime time;

  /// <summary>
  /// The temperature in degrees Celsius for this hour.
  /// </summary>
  final double temperature;

  /// <summary>
  /// The humidity level as a percentage (0-100).
  /// </summary>
  final int humidity;

  /// <summary>
  /// The weather conditions (sunny, rainy, cloudy, etc.).ditions (sunny, rainy, cloudy, etc.).
  /// </summary>
  final WeatherCode condition;

  /// <summary>
  /// Constructs a WeatherHour object with specific meteorological data./// Constructs a WeatherHour object with specific meteorological data.
  /// All parameters are required:ers are required:
  /// - <param name="time">Reference time for this data.</param>/param>
  /// - <param name="temperature">Temperature in degrees Celsius.</param>e="temperature">Temperature in degrees Celsius.</param>
  /// - <param name="humidity">Humidity percentage (0-100).</param>">Humidity percentage (0-100).</param>
  /// - <param name="condition">Current weather conditions.</param>/// - <param name="condition">Current weather conditions.</param>
  /// </summary>
  WeatherHour({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.condition,
  });
}
