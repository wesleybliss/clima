import 'dart:io';
import 'package:clima/domain/constants/constants.dart';
import 'package:clima/utils/firebase.dart';
import 'package:clima/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Adjust logging output as needed while developing
  Logger.globalLevel = LogLevel.verbose;
  Logger.globalPrefix = Constants.strings.appSlug;
  Logger.globalUsePrint = true;
  
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(600, 800),
      minimumSize: Size(300, 400),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
    });
  }

  // Initialize Firebase, crash logging, etc.
  await initializeFirebase();
  
  runApp(const Clima());
}

class Clima extends StatelessWidget {
  const Clima({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
