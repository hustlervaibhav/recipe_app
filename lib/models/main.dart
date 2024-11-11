import 'package:flutter/material.dart';
import 'package:recipe_app/models/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(
                255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
