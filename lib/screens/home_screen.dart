import 'package:flutter/material.dart';
import 'package:myapp/models/location.dart';
import 'package:myapp/models/weather_data.dart';
import 'package:myapp/services/location_service.dart';
import 'package:myapp/services/weather_service.dart';
import 'package:myapp/widgets/temperature_display.dart';
import 'package:myapp/widgets/weather_status.dart';
import 'package:myapp/widgets/weather_conditions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationService _locationService = LocationService();
  final WeatherService _weatherService = WeatherService();

  Location? _currentLocation;
  WeatherData? _currentWeather;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final location = await _locationService.getCurrentLocation();
      final weather = await _weatherService.fetchWeather(location);
      setState(() {
        _currentLocation = location;
        _currentWeather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.white));
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_currentWeather == null) {
      return const Center(child: Text('No weather data.', style: TextStyle(color: Colors.white)));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Location
        Text(
          _currentLocation?.name ?? 'Current Location',
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
        const SizedBox(height: 40),

        // Temperature
        TemperatureDisplay(temperature: _currentWeather!.temperature),
        const SizedBox(height: 40),

        // Weather Status
        WeatherStatus(
          weatherCode: _currentWeather!.weatherCode,
          isDay: _currentWeather!.isDay,
        ),
        const SizedBox(height: 60),

        // Weather Conditions
        WeatherConditions(
          apparentTemperature: _currentWeather!.apparentTemperature,
          humidity: _currentWeather!.humidity,
          windSpeed: _currentWeather!.windSpeed,
        ),
      ],
    );
  }
}
