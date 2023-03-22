import 'package:flutter/material.dart';
import 'package:map/screens/launch_screen.dart';
import 'package:map/screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/map_screen' : (context) => const MapScreen(),
      },
    );
  }
}

