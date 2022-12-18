import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {

  WeatherScreen({this.parseWeatherData});

  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var weatherData;
  var temp;
  var cityName;

  @override
  void initState() {
    // TODO: implement initState
    weatherData = widget.parseWeatherData;
    super.initState();
    print(widget.parseWeatherData);
    updateData(weatherData);
  }

  void updateData(dynamic weatherData){
    temp = weatherData['main']['temp'];
    cityName = weatherData['sys']['country'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$cityName",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                '$temp',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        )
      )
    );
  }
}
