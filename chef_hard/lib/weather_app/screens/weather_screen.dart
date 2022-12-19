import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    temp = weatherData['main']['temp'].round();
    cityName = weatherData['name'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.near_me),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
            ),
            onPressed: (){},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child:Stack(
          children: [
            Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),
          ],
        )
      ),
    );
  }
}
