import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  final double celsius;
  final double fahrenheit;

  const TemperatureDisplay({
    super.key,
    required this.celsius,
    required this.fahrenheit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTemperature(celsius, 'C'),
        const SizedBox(width: 40),
        _buildTemperature(fahrenheit, 'F'),
      ],
    );
  }

  Widget _buildTemperature(double temp, String unit) {
    return Column(
      children: [
        Text(
          '${temp.toStringAsFixed(0)}°',
          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
