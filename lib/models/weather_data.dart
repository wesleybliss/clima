class WeatherData {
  final double temperature;
  final int humidity;
  final double apparentTemperature;
  final int weatherCode;
  final double windSpeed;
  final bool isDay;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.windSpeed,
    required this.isDay,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['current']['temperature_2m'] as double,
      humidity: json['current']['relative_humidity_2m'] as int,
      apparentTemperature: json['current']['apparent_temperature'] as double,
      weatherCode: json['current']['weather_code'] as int,
      windSpeed: json['current']['wind_speed_10m'] as double,
      isDay: json['current']['is_day'] == 1,
    );
  }

  double get temperatureFahrenheit => (temperature * 9 / 5) + 32;
}
