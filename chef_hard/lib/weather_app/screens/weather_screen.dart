import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "City Name",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
