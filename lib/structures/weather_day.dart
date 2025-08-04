import 'weather_hour.dart';

/// <summary>
/// Represents aggregated weather data for a single day, including min/max temperatures and hourly details.
/// </summary>
class WeatherDay {
  /// <summary>
  /// Reference date for this weather data.
  /// </summary>
  final DateTime date;

  /// <summary>
  /// Maximum temperature for the day in Celsius.
  /// </summary>
  final double maxTemperature;

  /// <summary>
  /// Minimum temperature for the day in Celsius.
  /// </summary>
  final double minTemperature;

  /// <summary>
  /// List of hourly weather data for this day.
  /// </summary>
  final List<WeatherHour> hours;

  /// <summary>
  /// Constructs a WeatherDay object with all required daily weather data.
  /// </summary>
  /// <param name="date">Reference date.</param>
  /// <param name="maxTemperature">Maximum temperature.</param>
  /// <param name="minTemperature">Minimum temperature.</param>
  /// <param name="hours">List of hourly weather data.</param>
  WeatherDay({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.hours,
  });
}
