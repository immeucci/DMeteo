import 'package:dmeteo/structures/weather_code.dart';

/// <summary>
/// Represents the current weather conditions at a specific location.
/// Contains temperature, humidity, day/night status, and weather code.
/// </summary>
class CurrentWeather {
  /// <summary>
  /// The current temperature in degrees Celsius.
  /// </summary>
  final double temperature;

  /// <summary>
  /// The current humidity level as a percentage (0-100).
  /// </summary>
  final int humidity;

  /// <summary>
  /// Indicates whether it is currently day (true) or night (false).
  /// </summary>
  final bool isDay;

  /// <summary>
  /// The current weather condition code (e.g., sunny, rainy, cloudy).
  /// </summary>
  final WeatherCode condition;

  /// <summary>
  /// Constructs a CurrentWeather object with all required meteorological data.
  /// </summary>
  /// <param name="temperature">Current temperature in degrees Celsius.</param>
  /// <param name="humidity">Current humidity percentage (0-100).</param>
  /// <param name="isDay">True if it is day, false if night.</param>
  /// <param name="condition">Current weather condition code.</param>
  CurrentWeather({
    required this.temperature,
    required this.humidity,
    required this.isDay,
    required this.condition,
  });
}
