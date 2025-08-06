/// <summary>
/// AssetHelper provides utility methods for retrieving asset paths based on weather codes and time of day.
/// </summary>
class AssetHelper {
  /// <summary>
  /// Returns the file path for the appropriate weather GIF based on the weather code and time.
  /// </summary>
  /// <param name="weatherCode">A string representing the weather condition (e.g., 'clear', 'rain').</param>
  /// <param name="time">The DateTime object representing the current time.</param>
  /// <returns>Path to the corresponding weather GIF asset.</returns>
  static String getWeatherGif(String weatherCode, DateTime time) {
    switch (weatherCode) {
      case 'clear':
        // Return day or night clear GIF based on time
        return isDaytime(time)
            ? 'lib/resources/weather_gif/clear_day.gif'
            : 'lib/resources/weather_gif/clear_night.gif';
      case 'partlyCloudy':
        // Return day or night partly cloudy GIF based on time
        return isDaytime(time)
            ? 'lib/resources/weather_gif/partlyCloudy_day.gif'
            : 'lib/resources/weather_gif/partlyCloudy_night.gif';
      case 'cloudy':
        return 'lib/resources/weather_gif/cloudy.gif';
      case 'fog':
        return 'lib/resources/weather_gif/foggy.gif';
      case 'rain':
        return 'lib/resources/weather_gif/rainy.gif';
      case 'snow':
        return 'lib/resources/weather_gif/snowy.gif';
      case 'snowShowers':
        return 'lib/resources/weather_gif/snow_shower.gif';
      case 'thunderstorm':
        return 'lib/resources/weather_gif/thunderstorm.gif';
      case 'thunderstormWithHail':
        return 'lib/resources/weather_gif/hail.gif';
      default:
        // Fallback for unknown weather codes
        return 'lib/resources/weather_gif/unknown.gif';
    }
  }

  /// <summary>
  /// Determines if the provided time is during daytime (6 AM to 7 PM).
  /// </summary>
  /// <param name="time">The DateTime object to check.</param>
  /// <returns>True if daytime, false if nighttime.</returns>
  static bool isDaytime(DateTime time) {
    // Assuming daytime is from 6 AM to 7 PM
    return time.hour >= 6 && time.hour < 19;
  }
}
