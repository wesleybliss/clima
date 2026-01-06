import 'package:flutter/material.dart';

class WeatherStatus extends StatelessWidget {
  final int weatherCode;
  final bool isDay;

  const WeatherStatus({super.key, required this.weatherCode, required this.isDay});

  String _getWeatherDescription(int code) {
    // WMO Weather interpretation codes
    // (Taken from the Open-Meteo documentation)
    switch (code) {
      case 0: return 'Clear sky';
      case 1: return 'Mainly clear';
      case 2: return 'Partly cloudy';
      case 3: return 'Overcast';
      case 45: return 'Fog';
      case 48: return 'Depositing rime fog';
      case 51: return 'Light drizzle';
      case 53: return 'Moderate drizzle';
      case 55: return 'Dense drizzle';
      case 56: return 'Light freezing drizzle';
      case 57: return 'Dense freezing drizzle';
      case 61: return 'Slight rain';
      case 63: return 'Moderate rain';
      case 65: return 'Heavy rain';
      case 66: return 'Light freezing rain';
      case 67: return 'Heavy freezing rain';
      case 71: return 'Slight snow fall';
      case 73: return 'Moderate snow fall';
      case 75: return 'Heavy snow fall';
      case 77: return 'Snow grains';
      case 80: return 'Slight rain showers';
      case 81: return 'Moderate rain showers';
      case 82: return 'Violent rain showers';
      case 85: return 'Slight snow showers';
      case 86: return 'Heavy snow showers';
      case 95: return 'Thunderstorm';
      case 96: return 'Thunderstorm with slight hail';
      case 99: return 'Thunderstorm with heavy hail';
      default: return 'Unknown';
    }
  }

  IconData _getWeatherIcon(int code, bool isDay) {
    switch (code) {
      case 0: return isDay ? Icons.wb_sunny : Icons.nightlight_round;
      case 1: return isDay ? Icons.wb_sunny : Icons.nightlight_round;
      case 2: return Icons.cloud;
      case 3: return Icons.cloud_off;
      default: return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          _getWeatherIcon(weatherCode, isDay),
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          _getWeatherDescription(weatherCode),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
