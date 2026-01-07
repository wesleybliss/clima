import 'dart:io';
import 'package:flutter/material.dart';
import 'package:clima/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
