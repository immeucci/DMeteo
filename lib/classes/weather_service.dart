import 'package:dmeteo/structures/weather_day.dart';
import 'package:dmeteo/structures/weather_hour.dart';
import 'package:dmeteo/structures/weather_current.dart';
import 'package:dmeteo/structures/weather_code.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// <summary>
/// WeatherService handles fetching and parsing weather data from the Open-Meteo API.
/// It provides methods to retrieve daily and current weather information.
/// </summary>
class WeatherService {
  /// <summary>
  /// Stores the API request URL.
  /// </summary>
  late String url;

  /// <summary>
  /// Stores the decoded weather data from the API response.
  /// </summary>
  late Map<String, dynamic> data;

  /// <summary>
  /// Default constructor for WeatherService.
  /// </summary>
  WeatherService();

  /// <summary>
  /// Fetches weather data from the Open-Meteo API for the specified latitude and longitude.
  /// Populates the [data] field with the decoded response.
  /// </summary>
  /// <param name="latitude">Latitude of the location.</param>
  /// <param name="longitude">Longitude of the location.</param>
  Future<void> fetchWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    url =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=temperature_2m_max,weather_code,temperature_2m_min&hourly=temperature_2m,relative_humidity_2m,weather_code&current=temperature_2m,is_day,relative_humidity_2m,weather_code&past_days=3&forecast_days=3';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data');
    }

    data = json.decode(response.body);
  }

  /// <summary>
  /// Parses and returns a list of daily weather data from the fetched API response.
  /// Each [WeatherDay] contains its date, max/min temperatures, and hourly details.
  /// </summary>
  /// <returns>List of [WeatherDay] objects.</returns>
  List<WeatherDay> getDailyWeatherData() {
    final daily = data['daily'];
    final hourly = data['hourly'];
    List<WeatherDay> days = [];

    for (int i = 0; i < daily['time'].length; i++) {
      final date = DateTime.parse(daily['time'][i]);
      final maxTemp = daily['temperature_2m_max'][i].toDouble();
      final minTemp = daily['temperature_2m_min'][i].toDouble();

      // Collect hourly data for this day
      List<WeatherHour> hours = [];
      for (int j = 0; j < hourly['time'].length; j++) {
        final hourDate = DateTime.parse(hourly['time'][j]);
        if (hourDate.year == date.year &&
            hourDate.month == date.month &&
            hourDate.day == date.day) {
          hours.add(
            WeatherHour(
              time: hourDate,
              temperature: hourly['temperature_2m'][j].toDouble(),
              humidity: hourly['relative_humidity_2m'][j].toInt(),
              condition: WeatherCode.values[hourly['weather_code'][j]],
            ),
          );
        }
      }

      days.add(
        WeatherDay(
          date: date,
          maxTemperature: maxTemp,
          minTemperature: minTemp,
          hours: hours,
        ),
      );
    }

    return days;
  }

  /// <summary>
  /// Parses and returns the current weather data from the fetched API response.
  /// </summary>
  /// <returns>A [CurrentWeather] object with the latest weather information.</returns>
  CurrentWeather getCurrentWeather() {
    final current = data['current'];
    return CurrentWeather(
      temperature: current['temperature_2m'].toDouble(),
      humidity: current['relative_humidity_2m'].toInt(),
      isDay: current['is_day'] == 1,
      condition: WeatherCode.values[current['weather_code']],
    );
  }
}
