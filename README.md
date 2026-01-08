# clima

A fast, privacy-friendly weather application that provides current weather conditions based on your location. It features full offline support and includes an option for a FOSS (Free and Open Source Software) build without proprietary services.

[![Flutter CI/CD](https://github.com/wesleybliss/clima/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/wesleybliss/clima/actions/workflows/ci-cd.yml)

## Table of Contents

- [About](#about)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Development Commands](#development-commands)
- [Build Variants](#build-variants)
- [Localization](#localization)
- [Scripts](#scripts)
- [CI/CD](#cicd)
- [Contributing](#contributing)
- [TODO](#todo)
- [License](#license)

## About

clima is a Flutter-based weather application designed for speed, privacy, and offline resilience. It provides near real-time weather information for your current location, with local storage for offline use. The app follows a clear architectural pattern with separate layers for UI, services, and data models.

Key highlights:
- 🌍 **Location-based weather**: Automatically fetches weather for your current location.
- 📱 **Offline-first** architecture with local data storage (for location and last fetched weather).
- 🎨 **Customizable UI** with light/dark/system themes (via `ThemeData`).
- 🔒 **Privacy-focused** with optional FOSS builds (no tracking, no Firebase).
- ⚡ **Fast and responsive** with optimized state management.

## Features

### Weather Display

- **Current Temperature**: Displays temperature in Celsius and Fahrenheit.
- **Weather Conditions**: Shows current weather status and icons (e.g., sunny, cloudy, rainy).
- **Detailed Conditions**: Provides apparent temperature, humidity, and wind speed.

### Location Services

- **Automatic Location Detection**: Uses device's GPS to determine current location.
- **Geocoding**: Translates coordinates into human-readable location names.

### User Experience

- **Responsive Design**: Adapts to different screen sizes and platforms (mobile, desktop).
- **Loading and Error Handling**: Graceful display of loading indicators and error messages with retry options.

## Technology Stack

- **[Flutter](https://flutter.dev)** (Dart SDK ^3.2.3) - Cross-platform UI framework
- **[http](https://pub.dev/packages/http)** (^1.1.0) - For making HTTP requests to the Open-Meteo API
- **[window_manager](https://pub.dev/packages/window_manager)** (^0.3.8+1) - For managing desktop window properties
- **[firebase_core](https://pub.dev/packages/firebase_core)** (^2.24.2) - Firebase core functionalities (Standard build only)
- **[firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)** (^3.4.9) - Crash reporting (Standard build only)
- **[geolocator](https://pub.dev/packages/geolocator)** (^11.0.0) - For accessing location services
- **[geocoding](https://pub.dev/packages/geocoding)** (^3.0.0) - For geocoding and reverse geocoding
- **[logger](https://pub.dev/packages/logger)** (^2.0.2+1) - For structured logging

### Development Tools

- **[flutter_lints](https://pub.dev/packages/flutter_lints)** (^2.0.0) - Official Flutter lint rules
- **[build_runner](https://pub.dev/packages/build_runner)** (^2.4.7) - Code generation orchestration

## Architecture

The app follows a clear architectural pattern with separation of concerns:

```
┌─────────────────────────────────────────────┐
│              UI Layer                       │
│  (Screens, Widgets, Theme)                  │
└──────────────┬──────────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────────┐
│          Services Layer                     │
│  (Business Logic, Data Fetching)            │
└──────────────┬──────────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────────┐
│           Models Layer                      │
│  (Data Structures, Entities)                │
└─────────────────────────────────────────────┘
```

### Layer Responsibilities

**UI Layer** (`lib/screens/`, `lib/widgets/`)
- Screens and reusable UI components.
- Displays weather data and handles user interactions.

**Services Layer** (`lib/services/`)
- Contains business logic for fetching location and weather data.
- Interacts with external APIs (Open-Meteo) and device services (GPS).

**Models Layer** (`lib/models/`)
- Defines data structures for `Location` and `WeatherData`.

## Project Structure

```
clima/
├── lib/
│   ├── config/              # Application configuration (e.g., flavors)
│   ├── domain/              # Domain-specific constants
│   │   └── constants/       # App-wide constants (keys, strings)
│   ├── models/              # Data models and entities (Location, WeatherData)
│   ├── screens/             # Main application screens (e.g., home_screen.dart)
│   ├── services/            # Business logic and data fetching (LocationService, WeatherService)
│   ├── utils/               # Utility functions (e.g., Firebase, Logger)
│   ├── widgets/             # Reusable UI components (TemperatureDisplay, WeatherStatus, WeatherConditions)
│   └── main.dart            # Application entry point
├── bin/                     # Build and utility scripts
├── .github/                 # GitHub Actions workflows
├── android/                 # Android-specific configuration
├── ios/                     # iOS-specific configuration
├── linux/                   # Linux-specific configuration
├── macos/                   # macOS-specific configuration
├── web/                     # Web-specific configuration
├── windows/                 # Windows-specific configuration
├── test/                    # Unit and widget tests
└── pubspec.yaml             # Dependencies and project metadata
```

## Getting Started

### Prerequisites

- **Flutter SDK**: ^3.2.3 ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: ^3.2.3 (bundled with Flutter)
- **Android Studio** with Android SDK (for Android development)
- **Xcode** (for iOS development, macOS only)
- A physical device or emulator/simulator

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/wesleybliss/clima.git
    cd clima
    ```

2.  **Verify Flutter installation**
    ```bash
    flutter doctor -v
    ```
    Resolve any issues reported by `flutter doctor`.

3.  **Install dependencies**
    ```bash
    flutter clean
    flutter pub get
    ```

4.  **Generate code** (if any code generation is added in the future, e.g., for state management)
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    
    # Or start watcher for continuous generation during development
    flutter pub run build_runner watch --delete-conflicting-outputs
    ```

5.  **Run the app**
    ```bash
    flutter run
    ```

### First-Time Setup Notes

- Accept Android licenses if prompted: `flutter doctor --android-licenses`

## Development Commands

### Dependency Management

```bash
# Clean build artifacts and dependencies
flutter clean && flutter pub get

# Update dependencies
flutter pub upgrade
```

### Code Generation

```bash
# Generate code once
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and regenerate automatically
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Testing & Analysis

```bash
# Run static analysis
flutter analyze

# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart
```

### Building

```bash
# Build release APK
flutter build apk --release

# Build debug APK
flutter build apk --debug

# Build for iOS
flutter build ios --release
```

## Build Variants

The app supports two build flavors to accommodate different distribution channels and privacy requirements:

### Standard Build

- **Target**: Google Play Store, Apple App Store
- **Features**: Full-featured with Firebase Crashlytics for error reporting.
- **Build command**:
  ```bash
  flutter build apk --flavor standard --release
  ```

### FOSS Build

- **Target**: F-Droid and other FOSS app stores.
- **Features**: Excludes all proprietary libraries (Firebase, Google Services).
- **Privacy**: No telemetry, no crash reporting, fully open source.
- **Build commands**:
  ```bash
  ./bin/build-foss.sh              # Debug
  ./bin/build-foss-release.sh      # Release
  
  # Manual build
  flutter build apk --flavor foss --dart-define=FOSS_BUILD=true --release
  ```

### Key Differences

| Feature           | Standard | FOSS |
|-------------------|----------|------|
| Firebase Crashlytics | ✅       | ❌   |
| Error Reporting   | Remote   | Local only |
| Google Services   | ✅       | ❌   |
| Distribution      | Play Store, App Store | F-Droid, GitHub |

## Localization

The project includes a script for localization, but currently, no specific languages are defined beyond English.

### Adding or Updating Translations

1.  **Edit or create ARB files** in `lib/l10n/` (if the folder is created):
    - `app_en.arb` (English, template)
    - `app_es.arb` (Spanish)

2.  **Regenerate localization code**:
    ```bash
    ./bin/generate-i10n.sh
    # Or manually:
    flutter gen-l10n
    ```

### Localization Configuration

Localization is typically configured in `pubspec.yaml` and `l10n.yaml` (if present).

## Scripts

The `bin/` directory contains utility scripts for common development tasks:

| Script                    | Purpose                                  | Usage                                     |
|---------------------------|------------------------------------------|-------------------------------------------|
| `build-foss-release.sh`   | Build FOSS release APK                   | `./bin/build-foss-release.sh`             |
| `build-foss.sh`           | Build FOSS debug APK                     | `./bin/build-foss.sh`                     |
| `bundle.sh`               | Bundle a release build (e.g., AAB)       | `./bin/bundle.sh`                         |
| `clean.sh`                | Clean build artifacts                    | `./bin/clean.sh`                          |
| `generate-i10n.sh`        | Generate localization files              | `./bin/generate-i10n.sh`                  |
| `install-wireless.sh`     | Build and install to wireless device     | `./bin/install-wireless.sh`               |
| `release-foss.sh`         | Package FOSS release build               | `./bin/release-foss.sh`                   |
| `release.sh`              | Package standard release build           | `./bin/release.sh`                        |
| `watch.sh`                | Start build_runner watcher               | `./bin/watch.sh`                          |

All scripts should be run from the project root directory.

## CI/CD

The project uses **GitHub Actions** for continuous integration and deployment:

-   **Workflow**: [`.github/workflows/ci-cd.yml`](.github/workflows/ci-cd.yml)
-   **Triggers**: Push to `master` or `develop` branches.
-   **Steps**:
    1.  Install Flutter and dependencies.
    2.  Run tests (`flutter test`).
    3.  Set up signing keystore.
    4.  Set up Google Services (Firebase Crashlytics, etc.) for the Standard build.
    5.  Build both `standard` and `foss` release APKs.
    6.  Rename APKs and generate checksums.
    7.  Upload build artifacts.
    8.  Create GitHub Release (for `master` branch pushes).

### Branches

-   **`master`**: Stable releases, triggers production builds and GitHub releases.
-   **`develop`**: Development branch, triggers CI builds without releases.

## Contributing

Contributions are welcome! Please follow these guidelines:

1.  **Fork and create a branch**:
    ```bash
    git checkout -b feature/your-feature-name
    # Or for bug fixes:
    git checkout -b fix/issue-description
    ```

2.  **Follow the architecture**:
    -   Separate UI (`screens`, `widgets`), services (`services`), and models (`models`).
    -   Use the existing patterns for fetching data and updating the UI.

3.  **Write tests** for new features or bug fixes.

4.  **Run linting and tests** before committing:
    ```bash
    flutter analyze
    flutter test
    ```

5.  **Commit with clear messages**:
    -   Use conventional commit format: `feat:`, `fix:`, `docs:`, `refactor:`, etc.
    -   Example: `feat(weather): add 5-day forecast`

6.  **Submit a pull request** with:
    -   Clear description of changes.
    -   Reference to related issues (if applicable).
    -   Screenshots/recordings for UI changes.

## TODO

### Features
- [ ] Implement a 5-day weather forecast.
- [ ] Allow users to search for weather in different locations.
- [ ] Add unit conversion for temperature (C/F toggle).
- [ ] Implement a theme toggle for light/dark mode.

### UX Improvements
- [ ] Enhance UI with more dynamic weather animations or icons.
- [ ] Implement pull-to-refresh for weather data.
- [ ] Provide more detailed error messages to the user.

### Technical Improvements
- [ ] Add comprehensive unit and widget tests for services and UI components.
- [ ] Implement a more robust state management solution (e.g., Provider, Riverpod).
- [ ] Optimize network requests and add proper caching for weather data.
- [ ] Accessibility audit and improvements.

## License

See the [LICENSE](LICENSE) file for full details.

**Questions or Issues?** Open an issue on [GitHub](https://github.com/wesleybliss/clima/issues)