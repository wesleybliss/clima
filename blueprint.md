# Project: Clima

## Overview

A minimal Flutter weather app that shows current weather conditions using the device's GPS location.

## Features

*   **Temperature Display**: Shows temperature in both Fahrenheit and Celsius.
*   **Weather Status**: Displays an icon and text description of the current weather.
*   **Location Name**: Shows the user's city.
*   **Weather Conditions Grid**: A 2x2 grid showing "feels like" temperature, humidity, wind speed, and precipitation.
*   **Refresh Button**: Manually re-fetches weather data.
*   **Version Check**: Checks for a new version of the app from a remote file.
*   **Error Handling**: Gracefully handles location permission denial and API errors.

## App Structure

```
lib/
├── main.dart
├── models/
│   ├── weather_data.dart
│   └── location.dart
├── services/
│   ├── weather_service.dart
│   ├── location_service.dart
│   └── version_service.dart
├── screens/
│   └── home_screen.dart
└── widgets/
    ├── temperature_display.dart
    ├── weather_status.dart
    └── weather_conditions.dart
```

## Plan

1.  **Project Setup**:
    *   Add `geolocator`, `http`, and `provider` to `pubspec.yaml`.
    *   Configure location permissions for Android and iOS.
2.  **Create File Structure**:
    *   Create all the directories and empty files as outlined above.
3.  **Implement Data Models**:
    *   Create `WeatherData` and `Location` classes.
4.  **Implement Services**:
    *   `location_service.dart`: To get the device's location.
    *   `weather_service.dart`: To fetch data from the Open-Meteo API.
    *   `version_service.dart`: To check for app updates.
5.  **Build the UI**:
    *   Create the main `HomeScreen` to manage different states (loading, error, data).
    *   Develop the individual UI widgets: `TemperatureDisplay`, `WeatherStatus`, and `WeatherConditions`.
6.  **State Management**:
    *   Use `provider` to manage the app state and data flow.
7.  **Final Touches**:
    *   Implement error handling and the refresh functionality.
    *   Polish the UI and ensure everything works together.
