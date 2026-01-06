import 'package:flutter/material.dart';

class WeatherConditions extends StatelessWidget {
  final double apparentTemperature;
  final int humidity;
  final double windSpeed;

  const WeatherConditions({
    super.key,
    required this.apparentTemperature,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCondition(
          icon: Icons.thermostat,
          label: 'Feels Like',
          value: '${apparentTemperature.toStringAsFixed(0)}°C',
        ),
        _buildCondition(
          icon: Icons.water_drop,
          label: 'Humidity',
          value: '$humidity%',
        ),
        _buildCondition(
          icon: Icons.air,
          label: 'Wind',
          value: '${windSpeed.toStringAsFixed(1)} km/h',
        ),
      ],
    );
  }

  Widget _buildCondition({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
