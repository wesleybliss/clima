import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clima/models/weather_data.dart';
import 'package:clima/models/location.dart';

class WeatherService {
  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<WeatherData> fetchWeather(Location location) async {
    final currentParams = [
      'temperature_2m',
      'relative_humidity_2m',
      'apparent_temperature',
      'precipitation',
      'weather_code',
      'wind_speed_10m',
      'is_day'
    ].join(',');
    
    final params = [
      'latitude=${location.latitude}',
      'longitude=${location.longitude}',
      'current=$currentParams',
      'timezone=auto'
    ];

    final url = Uri.parse('$_baseUrl?${params.join('&')}');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        return WeatherData.fromJson(jsonBody);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the weather service: $e');
    }
  }
}
