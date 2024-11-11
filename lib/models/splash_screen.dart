import 'dart:async';

import 'package:flutter/material.dart';

import 'package:recipe_app/models/recipe_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  RecipeHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.fastfood,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "The Recipe App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Text(
                    "Haute cuisine",
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 255, 255, 255),
                        fontSize: 40,
                        fontFamily: 'cursive'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
